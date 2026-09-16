import { useMemo } from 'react';
import { User } from '../types/model';

export const useAdminPermissions = () => {
    return useMemo(() => {
        const storedUser = localStorage.getItem('user');
        if (!storedUser) return { canEdit: false };

        try {
            const user: User = JSON.parse(storedUser);
            const roles = user.roles || [];
            // Nếu là Admin thật thì có quyền Edit. Nếu là Demo Admin thì false.
            const isRealAdmin = roles.includes('ROLE_ADMIN') || roles.includes('ADMIN');
            return { canEdit: isRealAdmin };
        } catch (error) {
            return { canEdit: false };
        }
    }, []);
};
