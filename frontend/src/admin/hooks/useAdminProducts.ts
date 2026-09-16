import { useState } from 'react';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { getAdminProducts, putProductStock, patchProductStatus, deleteProduct, postImportProducts, AdminProductItem } from './adminService';
import { useNotify } from '../../components/NotificationContext';

export const useAdminProducts = () => {
    const queryClient = useQueryClient();
    const notify = useNotify();

    const [importing, setImporting] = useState(false); 
    const [editingId, setEditingId] = useState<number | null>(null);
    const [inputStock, setInputStock] = useState<number>(0);
    
    // Filters state
    const [filters, setFilters] = useState({
        keyword: '',
        status: '',
        inventoryStatus: '', 
        categoryId: '',
        page: 0
    });

    // 🚀 React Query: Tự động fetch, cache 5 phút, tự động loading state
    const { data, isLoading: loading, error } = useQuery({
        queryKey: ['adminProducts', filters.page, filters.status, filters.inventoryStatus, filters.categoryId, filters.keyword],
        queryFn: () => getAdminProducts(filters),
        staleTime: 5 * 60 * 1000, // Dữ liệu sẽ tươi trong 5 phút
    });

    if (error) {
        console.error(error);
        notify.error("Không thể tải danh sách sản phẩm");
    }

    // Trích xuất dữ liệu trả về từ cache
    const products: AdminProductItem[] = data?.content || [];
    const pageInfo = data ? {
        totalPages: data.totalPages,
        totalElements: data.totalElements,
        currentPage: data.number
    } : { totalPages: 0, totalElements: 0, currentPage: 0 };

    const loadData = () => {
        // Dùng invalidateQueries để ép làm mới thay vì loadData() thủ công
        queryClient.invalidateQueries({ queryKey: ['adminProducts'] });
    };

    const handleSearchSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        setFilters(prev => ({ ...prev, page: 0 })); 
    };

    const handleSaveStock = async (productId: number) => {
        try {
            await putProductStock(productId, inputStock);
            notify.success("Cập nhật số lượng kho thành công!");
            setEditingId(null);
            loadData();
        } catch (err: any) {
            const errorData = err.response?.data;
            const errorMsg = typeof errorData === 'object' ? (errorData.message || errorData.error) : errorData;
            notify.error(errorMsg || "Không thể cập nhật số lượng kho!");
        }
    };

    const handleStatusChange = async (productId: number, currentStatus: string) => {
        const nextStatus = currentStatus === 'active' ? 'inactive' : 'active';
        try {
            await patchProductStatus(productId, nextStatus);
            notify.success("Đổi trạng thái thành công!");
            loadData();
        } catch (err: any) {
            notify.error(err.response?.data || "Lỗi khi đổi trạng thái hiển thị!");
        }
    };

    const handleDelete = async (productId: number) => {
        try {
            await deleteProduct(productId);
            notify.success("Xóa sản phẩm thành công!");
            loadData();
        } catch (err: any) {
            const errorData = err.response?.data;
            const errorMsg = typeof errorData === 'object' ? (errorData.message || errorData.error) : errorData;
            notify.error(errorMsg || "Không thể xóa sản phẩm này!");
        }
    };

    const handleImportExcel = async (file: File) => {
        const fileExtension = file.name.split('.').pop()?.toLowerCase();
        if (fileExtension !== 'xlsx') {
            notify.error("Hệ thống từ chối! Vui lòng chọn đúng file Excel định dạng .xlsx");
            return;
        }

        if (window.confirm(`Xác nhận nhập dữ liệu sản phẩm từ file: "${file.name}"?`)) {
            setImporting(true);
            try {
                const report = await postImportProducts(file);
                alert(report); 
                loadData(); 
            } catch (err: any) {
                const errorData = err.response?.data;
                const errMsg = typeof errorData === 'object' ? (errorData.message || errorData.error) : errorData;
                alert(`❌ IMPORT THẤT BẠI:\n${errMsg || "Cấu trúc file lỗi hoặc không thể đọc dữ liệu!"}`);
            } finally {
                setImporting(false);
            }
        }
    };

    return {
        products,
        loading,
        importing, 
        pageInfo,
        editingId,
        inputStock,
        filters,
        setFilters,
        setInputStock,
        handleSearchSubmit,
        handleSaveStock,
        handleStatusChange,
        handleDelete,
        handleImportExcel,
        handleStartEdit: (id: number, stock: number) => { setEditingId(id); setInputStock(stock); },
        handleCancelEdit: () => setEditingId(null)
    };
};