<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strum & Co. - Premium Guitar Store</title>
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        /* Header Styles */
        header {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: white;
            padding: 1rem 0;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .logo span {
            color: #ff6b6b;
        }

        nav ul {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
            padding: 0.5rem 0;
            position: relative;
        }

        nav a:hover {
            color: #ff6b6b;
        }

        nav a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #ff6b6b;
            transition: width 0.3s ease;
        }

        nav a:hover::after {
            width: 100%;
        }

        .cart-icon {
            position: relative;
            cursor: pointer;
        }

        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background-color: #ff6b6b;
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.75rem;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://placehold.co/1200x600/16213e/ffffff?text=Guitar+Store') no-repeat center center/cover;
            height: 600px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content {
            max-width: 800px;
            padding: 0 2rem;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }

        .hero p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }

        .btn {
            display: inline-block;
            background-color: #ff6b6b;
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn:hover {
            background-color: #ff5252;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.4);
        }

        /* Featured Products */
        .featured {
            padding: 5rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .section-title h2 {
            font-size: 2.5rem;
            color: #16213e;
            display: inline-block;
        }

        .section-title h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: #ff6b6b;
            border-radius: 2px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .product-img {
            height: 250px;
            width: 100%;
            object-fit: cover;
        }

        .product-info {
            padding: 1.5rem;
        }

        .product-title {
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
            color: #16213e;
        }

        .product-desc {
            color: #666;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }

        .product-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #ff6b6b;
            margin-bottom: 1rem;
        }

        .product-btn {
            width: 100%;
            padding: 0.75rem;
            background-color: #16213e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: 600;
        }

        .product-btn:hover {
            background-color: #0f172a;
        }

        /* Categories Section */
        .categories {
            padding: 5rem 2rem;
            background-color: #f0f2f5;
        }

        .categories-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .category-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            text-align: center;
            padding: 2rem 1rem;
        }

        .category-card:hover {
            transform: translateY(-5px);
        }

        .category-img {
            width: 100px;
            height: 100px;
            margin: 0 auto 1rem;
            object-fit: contain;
        }

        .category-title {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: #16213e;
        }

        .category-desc {
            color: #666;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }

        /* Testimonials */
        .testimonials {
            padding: 5rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .testimonial-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            position: relative;
        }

        .testimonial-card::before {
            content: """;
            position: absolute;
            top: 10px;
            left: 20px;
            font-size: 5rem;
            color: #ff6b6b;
            opacity: 0.2;
            font-family: Georgia, serif;
        }

        .testimonial-text {
            margin-bottom: 1.5rem;
            font-style: italic;
            color: #333;
            position: relative;
            z-index: 1;
        }

        .testimonial-author {
            display: flex;
            align-items: center;
        }

        .author-img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1rem;
        }

        .author-info h4 {
            color: #16213e;
            margin-bottom: 0.25rem;
        }

        .author-info p {
            color: #666;
            font-size: 0.9rem;
        }

        /* Newsletter */
        .newsletter {
            padding: 5rem 2rem;
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: white;
            text-align: center;
        }

        .newsletter-container {
            max-width: 600px;
            margin: 0 auto;
        }

        .newsletter h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .newsletter p {
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }

        .newsletter-form {
            display: flex;
            max-width: 500px;
            margin: 0 auto;
        }

        .newsletter-input {
            flex: 1;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 30px 0 0 30px;
            font-size: 1rem;
            outline: none;
        }

        .newsletter-btn {
            background-color: #ff6b6b;
            color: white;
            border: none;
            padding: 0 1.5rem;
            border-radius: 0 30px 30px 0;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .newsletter-btn:hover {
            background-color: #ff5252;
        }

        /* Footer */
        footer {
            background-color: #0f172a;
            color: white;
            padding: 4rem 2rem 2rem;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .footer-col h3 {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .footer-col h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: #ff6b6b;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 0.75rem;
        }

        .footer-links a {
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: #ff6b6b;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            background-color: #333;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s ease;
            text-decoration: none;
            color: white;
        }

        .social-icon:hover {
            background-color: #ff6b6b;
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid #333;
            color: #ccc;
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                padding: 1rem;
            }

            nav ul {
                margin: 1rem 0;
                gap: 1rem;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .newsletter-form {
                flex-direction: column;
                gap: 1rem;
            }

            .newsletter-input, .newsletter-btn {
                border-radius: 30px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header>
    <div class="header-container">
        <div class="logo">Strum<span>&Co.</span></div>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Shop</a></li>
                <li><a href="#">Electric Guitars</a></li>
                <li><a href="#">Acoustic Guitars</a></li>
                <li><a href="#">Accessories</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
        <div class="cart-icon">
            🛒
            <span class="cart-count">0</span>
        </div>
    </div>
</header>

<!-- Hero Section -->
<section class="hero">
    <div class="hero-content">
        <h1>Find Your Perfect Sound</h1>
        <p>Discover our premium collection of electric and acoustic guitars from the world's most renowned brands.</p>
        <a href="#" class="btn">Shop Now</a>
    </div>
</section>

<!-- Featured Products -->
<section class="featured">
    <div class="section-title">
        <h2>Featured Guitars</h2>
    </div>
    <div class="products">
        <div class="product-card">
            <img src="https://placehold.co/400x300/16213e/ffffff?text=Fender+Stratocaster" alt="Fender Stratocaster" class="product-img">
            <div class="product-info">
                <h3 class="product-title">Fender Stratocaster</h3>
                <p class="product-desc">The legendary electric guitar that defined generations of music.</p>
                <p class="product-price">$1,299.99</p>
                <button class="product-btn">Add to Cart</button>
            </div>
        </div>
        <div class="product-card">
            <img src="https://placehold.co/400x300/16213e/ffffff?text=Gibson+Les+Paul" alt="Gibson Les Paul" class="product-img">
            <div class="product-info">
                <h3 class="product-title">Gibson Les Paul</h3>
                <p class="product-desc">Rich, warm tones and iconic design that shaped rock 'n' roll.</p>
                <p class="product-price">$2,499.99</p>
                <button class="product-btn">Add to Cart</button>
            </div>
        </div>
        <div class="product-card">
            <img src="https://placehold.co/400x300/16213e/ffffff?text=Martin+D-28" alt="Martin D-28" class="product-img">
            <div class="product-info">
                <h3 class="product-title">Martin D-28</h3>
                <p class="product-desc">The gold standard of acoustic guitars with unmatched resonance.</p>
                <p class="product-price">$3,199.99</p>
                <button class="product-btn">Add to Cart</button>
            </div>
        </div>
    </div>
</section>

<!-- Categories -->
<section class="categories">
    <div class="categories-container">
        <div class="section-title">
            <h2>Guitar Categories</h2>
        </div>
        <div class="category-grid">
            <div class="category-card">
                <img src="https://placehold.co/100x100/16213e/ffffff?text=🎸" alt="Electric Guitars" class="category-img">
                <h3 class="category-title">Electric Guitars</h3>
                <p class="category-desc">Powerful, versatile instruments for rock, metal, and beyond.</p>
                <a href="#" class="btn">Explore</a>
            </div>
            <div class="category-card">
                <img src="https://placehold.co/100x100/16213e/ffffff?text=🎸" alt="Acoustic Guitars" class="category-img">
                <h3 class="category-title">Acoustic Guitars</h3>
                <p class="category-desc">Pure, natural sound perfect for singer-songwriters and folk.</p>
                <a href="#" class="btn">Explore</a>
            </div>
            <div class="category-card">
                <img src="https://placehold.co/100x100/16213e/ffffff?text=🎸" alt="Bass Guitars" class="category-img">
                <h3 class="category-title">Bass Guitars</h3>
                <p class="category-desc">Deep, resonant tones that form the foundation of any band.</p>
                <a href="#" class="btn">Explore</a>
            </div>
            <div class="category-card">
                <img src="https://placehold.co/100x100/16213e/ffffff?text=🎸" alt="Accessories" class="category-img">
                <h3 class="category-title">Accessories</h3>
                <p class="category-desc">Strings, picks, straps, and everything you need to play.</p>
                <a href="#" class="btn">Explore</a>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials -->
<section class="testimonials">
    <div class="section-title">
        <h2>What Our Customers Say</h2>
    </div>
    <div class="testimonial-grid">
        <div class="testimonial-card">
            <p class="testimonial-text">I've been playing for 20 years, and the Gibson Les Paul I bought from Strum & Co. is hands down the best guitar I've ever owned. The service was exceptional too!</p>
            <div class="testimonial-author">
                <img src="https://placehold.co/50x50/16213e/ffffff?text=JD" alt="John Doe" class="author-img">
                <div class="author-info">
                    <h4>John Doe</h4>
                    <p>Professional Musician</p>
                </div>
            </div>
        </div>
        <div class="testimonial-card">
            <p class="testimonial-text">As a beginner, I was overwhelmed by choices. The staff at Strum & Co. helped me find the perfect starter guitar that has inspired me to keep learning every day.</p>
            <div class="testimonial-author">
                <img src="https://placehold.co/50x50/16213e/ffffff?text=JS" alt="Jane Smith" class="author-img">
                <div class="author-info">
                    <h4>Jane Smith</h4>
                    <p>Beginner Guitarist</p>
                </div>
            </div>
        </div>
        <div class="testimonial-card">
            <p class="testimonial-text">The quality of instruments at Strum & Co. is unmatched. I found a vintage Fender that was perfectly restored. Their attention to detail and customer care is truly remarkable.</p>
            <div class="testimonial-author">
                <img src="https://placehold.co/50x50/16213e/ffffff?text=MR" alt="Mike Rodriguez" class="author-img">
                <div class="author-info">
                    <h4>Mike Rodriguez</h4>
                    <p>Collectors</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Newsletter -->
<section class="newsletter">
    <div class="newsletter-container">
        <h2>Join Our Melody</h2>
        <p>Subscribe to get special offers, free giveaways, and once-in-a-lifetime deals.</p>
        <form class="newsletter-form">
            <input type="email" placeholder="Enter your email" class="newsletter-input" required>
            <button type="submit" class="newsletter-btn">Subscribe</button>
        </form>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="footer-container">
        <div class="footer-col">
            <h3>Strum & Co.</h3>
            <p>Your premier destination for premium guitars and musical instruments. We're dedicated to helping you find the perfect instrument to express your musical soul.</p>
            <div class="social-links">
                <a href="#" class="social-icon">f</a>
                <a href="#" class="social-icon">t</a>
                <a href="#" class="social-icon">in</a>
                <a href="#" class="social-icon">ig</a>
            </div>
        </div>
        <div class="footer-col">
            <h3>Shop</h3>
            <ul class="footer-links">
                <li><a href="#">Electric Guitars</a></li>
                <li><a href="#">Acoustic Guitars</a></li>
                <li><a href="#">Bass Guitars</a></li>
                <li><a href="#">Accessories</a></li>
                <li><a href="#">New Arrivals</a></li>
                <li><a href="#">Special Offers</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h3>Support</h3>
            <ul class="footer-links">
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">FAQs</a></li>
                <li><a href="#">Shipping & Returns</a></li>
                <li><a href="#">Warranty</a></li>
                <li><a href="#">Setup & Maintenance</a></li>
                <li><a href="#">Financing Options</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h3>Contact</h3>
            <ul class="footer-links">
                <li>123 Music Street, Nashville, TN</li>
                <li>Phone: (555) 123-4567</li>
                <li>Email: info@strumandco.com</li>
                <li>Hours: Mon-Sat 10am-8pm</li>
                <li>Sunday 12pm-6pm</li>
            </ul>
        </div>
    </div>
    <div class="copyright">
        &copy; 2023 Strum & Co. All Rights Reserved.
    </div>
</footer>
</body>
</html>