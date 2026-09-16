import React, { useState } from 'react';
import { useRegister } from '../hooks/useRegister'; 
import { EyeIcon, EyeSlashIcon } from '@heroicons/react/24/outline';
import '../Styles/auth.css';

interface RegisterProps {
    onSwitchToLogin: () => void;
    onClose: () => void;
}

const Register: React.FC<RegisterProps> = ({ onSwitchToLogin, onClose }) => {
    const {
        email, setEmail,
        password, setPassword,
        confirmPassword, setConfirmPassword,
        username, setUsername,
        fullName, setFullName, 
        phone, setPhone, 
        agreedToTerms, setAgreedToTerms,
        error, message, isLoading,
        captchaCode, userCaptchaInput, setUserCaptchaInput, captchaColor,
        generateCaptcha,
        handleRegister
    } = useRegister(onSwitchToLogin);

    const [showPassword, setShowPassword] = useState(false);
    const [showConfirmPassword, setShowConfirmPassword] = useState(false);

    return (
        <div className="auth-container">
            <button className="auth-close-button" onClick={onClose} aria-label="Close">
                &times; 
            </button>
            <h2>Đăng Ký Tài Khoản</h2>
            
            <form onSubmit={handleRegister} className="auth-form">
                {error && <p className="auth-error">{error}</p>}
                {message && <p className="auth-message">{message}</p>}

                <input 
                    type="text" 
                    placeholder="Tên đăng nhập (viết liền không dấu)" 
                    value={username} 
                    onChange={(e) => setUsername(e.target.value)} 
                    required 
                    className="auth-input" 
                />
            
                <input 
                    type="text" 
                    placeholder="Họ và tên" 
                    value={fullName} 
                    onChange={(e) => setFullName(e.target.value)} 
                    required
                    className="auth-input" 
                />

                <input 
                    type="text" 
                    placeholder="Số điện thoại" 
                    value={phone} 
                    onChange={(e) => setPhone(e.target.value)}
                    required
                    className="auth-input" 
                />

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
                        placeholder="Mật khẩu (ít nhất 6 ký tự)" 
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

                <div className="password-input-wrapper" style={{ position: 'relative' }}>
                    <input 
                        type={showConfirmPassword ? "text" : "password"} 
                        placeholder="Xác nhận mật khẩu" 
                        value={confirmPassword} 
                        onChange={(e) => setConfirmPassword(e.target.value)} 
                        required 
                        className="auth-input" 
                        style={{ width: '100%' }}
                    />
                    <button 
                        type="button"
                        onClick={() => setShowConfirmPassword(!showConfirmPassword)}
                        className="password-toggle-btn"
                        style={{ position: 'absolute', right: '10px', top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', cursor: 'pointer', color: '#6b7280' }}
                    >
                        {showConfirmPassword ? <EyeSlashIcon className="w-5 h-5" style={{ width: '20px', height: '20px' }} /> : <EyeIcon className="w-5 h-5" style={{ width: '20px', height: '20px' }} />}
                    </button>
                </div>

                <div className="captcha-section">
                    <label className="captcha-label">Mã xác nhận (Click vào mã để đổi):</label>
                    <div 
                        className="captcha-display" 
                        onClick={generateCaptcha}
                        style={{ color: captchaColor }}
                        title="Đổi mã khác"
                    >
                        {captchaCode}
                    </div>
                    <input 
                        type="text" 
                        placeholder="Nhập mã xác nhận" 
                        value={userCaptchaInput} 
                        onChange={(e) => setUserCaptchaInput(e.target.value)} 
                        required 
                        className="auth-input captcha-input" 
                    />
                </div>

                <div className="terms-section" style={{ display: 'flex', alignItems: 'flex-start', margin: '10px 0', gap: '8px', fontSize: '13px', color: '#4b5563' }}>
                    <input 
                        type="checkbox" 
                        id="terms" 
                        checked={agreedToTerms}
                        onChange={(e) => setAgreedToTerms(e.target.checked)}
                        style={{ marginTop: '3px' }}
                    />
                    <label htmlFor="terms">
                        Tôi đã đọc và đồng ý với <a href="#" style={{ color: '#d97706', textDecoration: 'none' }}>Điều khoản dịch vụ</a> & <a href="#" style={{ color: '#d97706', textDecoration: 'none' }}>Chính sách bảo mật</a>
                    </label>
                </div>

                <button type="submit" className={`auth-button ${isLoading || !agreedToTerms ? 'disabled' : ''}`} disabled={isLoading || !agreedToTerms}>
                    {isLoading ? 'Đang xử lý...' : 'Đăng Ký'}
                </button>
            </form>

            <p className="auth-switch-text">
                Đã có tài khoản? <span onClick={onSwitchToLogin} className="auth-link">Đăng nhập</span>
            </p>
        </div>
    );
};

export default Register;