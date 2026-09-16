import React, { useState } from 'react';
import { User } from '../types/model';
import { useLogin } from '../hooks/useLogin'; 
import { EyeIcon, EyeSlashIcon } from '@heroicons/react/24/outline';
import '../Styles/auth.css';

interface LoginProps {
    onLoginSuccess: (user: User) => void;
    onSwitchToRegister: () => void;
    onSwitchToForgot: () => void;
    onClose: () => void;
}

const Login: React.FC<LoginProps> = ({ 
    onLoginSuccess, 
    onSwitchToRegister, 
    onSwitchToForgot, 
    onClose 
}) => {
    const {
        email,
        setEmail,
        password,
        setPassword,
        error,
        isLoading,
        handleSubmit,
        handleDemoLogin
    } = useLogin(onLoginSuccess);

    const [showPassword, setShowPassword] = useState(false);

    return (
        <div className="auth-container">
            <button className="auth-close-button" onClick={onClose}>
                &times; 
            </button>
            
            <h2>Đăng Nhập</h2>
            
            <form onSubmit={handleSubmit} className="auth-form">
                {error && <p className="auth-error">{error}</p>}

                <input
                    type="email"
                    placeholder="Email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                    className="auth-input"
                />

                <div className="password-input-wrapper" style={{ position: 'relative' }}>
                    <input
                        type={showPassword ? "text" : "password"}
                        placeholder="Mật khẩu"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        required
                        className="auth-input"
                        style={{ width: '100%' }}
                    />
                    <button 
                        type="button"
                        onClick={() => setShowPassword(!showPassword)}
                        className="password-toggle-btn"
                        style={{ position: 'absolute', right: '10px', top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', cursor: 'pointer', color: '#6b7280' }}
                    >
                        {showPassword ? <EyeSlashIcon className="w-5 h-5" style={{ width: '20px', height: '20px' }} /> : <EyeIcon className="w-5 h-5" style={{ width: '20px', height: '20px' }} />}
                    </button>
                </div>

                <button type="submit" className={`auth-button ${isLoading ? 'disabled' : ''}`} disabled={isLoading}>
                    {isLoading ? 'Đang xử lý...' : 'Đăng Nhập'}
                </button>
                <button 
                    type="button" 
                    className={`auth-button demo-button ${isLoading ? 'disabled' : ''}`} 
                    onClick={handleDemoLogin} 
                    disabled={isLoading}
                    style={{ backgroundColor: '#10b981', marginTop: '10px', opacity: isLoading ? 0.7 : 1 }}
                >
                    {isLoading ? 'Đang xử lý...' : 'Đăng Nhập Nhanh (Demo)'}
                </button>
            </form>

            {/* Các link chuyển hướng giữ nguyên cấu trúc thẻ <a> */}
            <p className="auth-switch-text">
                <a href="#" onClick={(e) => { e.preventDefault(); onSwitchToForgot(); }} className="auth-link">
                    Quên Mật khẩu?
                </a>
            </p>
            <p className="auth-switch-text">
                Chưa có tài khoản? 
                <a href="#" onClick={(e) => { e.preventDefault(); onSwitchToRegister(); }} className="auth-link">
                    Đăng ký ngay
                </a>
            </p>
        </div>
    );
};

export default Login;