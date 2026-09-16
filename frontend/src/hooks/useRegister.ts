import { useState, useEffect } from 'react';
import { registerUser } from '../services/AuthService';

export const useRegister = (onSuccess?: () => void) => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');
    const [username, setUsername] = useState('');
    const [fullName, setFullName] = useState('');
    const [phone, setPhone] = useState('');
    const [agreedToTerms, setAgreedToTerms] = useState(false);
    
    const [error, setError] = useState('');
    const [message, setMessage] = useState('');
    const [isLoading, setIsLoading] = useState(false);

    const [captchaCode, setCaptchaCode] = useState('');
    const [userCaptchaInput, setUserCaptchaInput] = useState('');
    const [captchaColor, setCaptchaColor] = useState('#000');

    const generateCaptcha = () => {
        const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        let result = '';
        for (let i = 0; i < 6; i++) result += chars.charAt(Math.floor(Math.random() * chars.length));
        const randomColor = `rgb(${Math.floor(Math.random() * 100)}, ${Math.floor(Math.random() * 100)}, ${Math.floor(Math.random() * 100)})`;
        setCaptchaCode(result);
        setCaptchaColor(randomColor);
        setUserCaptchaInput(''); 
    };

    useEffect(() => { generateCaptcha(); }, []);

    const validateForm = () => {
        // Tên đăng nhập không được có khoảng trắng hoặc ký tự đặc biệt
        const usernameRegex = /^[a-zA-Z0-9_]+$/;
        if (!usernameRegex.test(username)) {
            setError('Tên đăng nhập không hợp lệ (không chứa khoảng trắng, ký tự đặc biệt).');
            return false;
        }

        // Số điện thoại Việt Nam (10 số, đầu 03, 05, 07, 08, 09)
        const phoneRegex = /^(03|05|07|08|09)[0-9]{8}$/;
        if (phone && !phoneRegex.test(phone)) {
            setError('Số điện thoại không hợp lệ (phải đủ 10 số, chuẩn Việt Nam).');
            return false;
        }

        if (password.length < 6) { 
            setError('Mật khẩu phải có ít nhất 6 ký tự.'); 
            return false; 
        }

        if (password !== confirmPassword) {
            setError('Mật khẩu xác nhận không trùng khớp.');
            return false;
        }

        if (!agreedToTerms) {
            setError('Bạn cần đồng ý với Điều khoản dịch vụ.');
            return false;
        }

        if (userCaptchaInput !== captchaCode) {
            setError('Mã xác nhận không chính xác.');
            generateCaptcha();
            return false;
        }

        return true;
    };

    const handleRegister = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        setError('');
        setMessage('');

        if (!validateForm()) return;

        setIsLoading(true);

        try {
            await registerUser({ 
                email, 
                password, 
                username, 
                fullName, 
                phone 
            });

            setMessage('Đăng ký thành công! Đang chuyển hướng đến Đăng nhập...');
            
            if (onSuccess) {
                setTimeout(() => {
                    setIsLoading(false);
                    onSuccess();
                }, 1500);
            } else {
                setEmail(''); 
                setPassword('');
                setConfirmPassword('');
                setUsername('');
                setFullName(''); 
                setPhone('');
                setAgreedToTerms(false);
                generateCaptcha();
                setIsLoading(false);
            }
        } catch (err) {
            setError((err as Error).message || 'Lỗi đăng ký. Vui lòng thử lại.');
            generateCaptcha();
            setIsLoading(false);
        }
    };

    return { 
        email, setEmail, 
        password, setPassword, 
        confirmPassword, setConfirmPassword,
        username, setUsername,
        fullName, setFullName, 
        phone, setPhone, 
        agreedToTerms, setAgreedToTerms,
        error, message, isLoading,
        captchaCode, userCaptchaInput, setUserCaptchaInput, captchaColor, 
        generateCaptcha, handleRegister 
    };
};