<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Happy Tails Adoption - Home</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Font Awesome for Social Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        body {
            background-color: #fff;
            color: #333;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, Arial, sans-serif;
        }
        header, footer {
            background-color: #111;
            color: white;
        }
        .btn-danger {
            background-color: #b30000;
            border-color: #b30000;
        }
        .btn-danger:hover {
            background-color: #800000;
            border-color: #800000;
        }
        /* Hero section */
        .hero {
            background: #f8f9fa;
            padding: 4rem 1rem;
            text-align: center;
            max-width: 900px;
            margin: 2rem auto;
            border-radius: 0.75rem;
            box-shadow: 0 0 15px rgb(0 0 0 / 0.1);
        }
        .hero h2 {
            font-size: 2.75rem;
            font-weight: 700;
            color: #b30000;
            margin-bottom: 1rem;
        }
        .hero p {
            font-size: 1.25rem;
            color: #555;
        }
        /* About teaser */
        .about-teaser {
            max-width: 700px;
            margin: 3rem auto;
            text-align: center;
        }
        .about-teaser p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 1.5rem;
        }
        /* Dog cards */
        .dog-card {
            box-shadow: 0 4px 12px rgb(0 0 0 / 0.1);
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: #fff;
            text-align: center;
        }
        .dog-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgb(0 0 0 / 0.2);
        }
        .dog-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }
        .dog-card h3 {
            font-weight: 700;
            color: #b30000;
            margin: 1rem 0 0.5rem;
            font-size: 1.5rem;
        }
        .dog-card p {
            color: #555;
            font-size: 1rem;
            margin-bottom: 1rem;
            padding: 0 1rem;
        }
        /* Adoption section */
        .adoption-section {
            max-width: 900px;
            margin: 3rem auto 5rem;
            background: #fff;
            padding: 2.5rem 2rem;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgb(0 0 0 / 0.1);
            text-align: center;
        }
        .adoption-section p {
            font-size: 1.15rem;
            margin-bottom: 1.5rem;
            color: #555;
        }
        /* Footer */
        footer {
            padding: 2.5rem 1rem;
            text-align: center;
        }
        footer p {
            margin: 0;
            font-size: 0.9rem;
            color: #ccc;
        }
        .social-links {
            margin-top: 1rem;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .social-btn {
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            border-radius: 50%;
            font-size: 20px;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }
        .social-btn.fb { background: #3b5998; }
        .social-btn.ig { background: #E1306C; }
        .social-btn.wa { background: #25D366; }
        .social-btn:hover {
            transform: scale(1.25);
            opacity: 0.9;
        }
    </style>
</head>
<body>

<!-- Header / Navigation -->
<header>
    <nav class="navbar navbar-expand-lg navbar-dark container">
        <a class="navbar-brand fs-3 fw-bold" href="index.html">Happy Tails</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav fs-5">
                <li class="nav-item"><a class="nav-link active" href="index.html">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="#dogs">Dogs</a></li>
                <li class="nav-item"><a class="nav-link" href="adoption.html">Adoption</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>
        </div>
    </nav>
</header>

<!-- Hero Section -->
<section class="hero">
    <h2>Adopt Love, Adopt a Dog </h2>
    <p>Welcome to our dog adoption center in Nepal. Scroll through and meet your future furry friend!</p>
</section>

<!-- About Us teaser -->
<section class="about-teaser">
    <h2 class="text-warning fw-bold fs-3 mb-3">About Us</h2>
    <p>We are passionate about rescuing and finding loving homes for dogs across Nepal. Learn more about our mission and team.</p>
    <a href="about.html" class="btn btn-danger btn-lg px-4">Read More</a>
</section>

<!-- Dogs Section -->
<section class="container" id="dogs">
    <h2 class="text-center text-danger fw-bold fs-2 mb-4 text-uppercase">Meet Our Dogs</h2>
    <div class="row g-4 justify-content-center">

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <div class="dog-card">
                <img src="https://i0.wp.com/morrisfocus.com/uploadedmedia/2019/11/Cooper-2.jpg?fit=720%2C480&ssl=1" alt="Max the Dog" />
                <h3>Max</h3>
                <p>Friendly Labrador, 2 years old.</p>
                <a href="dog1.html" class="btn btn-danger mb-3">Adopt Max</a>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <div class="dog-card">
                <img src="https://tse1.mm.bing.net/th/id/OIP.RZaT0vj-hzsh7PF7tWH7vQHaEP?pid=ImgDetMain" alt="Luna the Dog" />
                <h3>Luna</h3>
                <p>Playful Beagle, 1.5 years old.</p>
                <a href="dog2.html" class="btn btn-danger mb-3">Adopt Luna</a>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <div class="dog-card">
                <img src="https://cdn.britannica.com/79/232779-050-6B0411D7/German-Shepherd-dog-Alsatian.jpg" alt="Rocky the Dog" />
                <h3>Rocky</h3>
                <p>Energetic German Shepherd, 3 years old.</p>
                <a href="dog3.html" class="btn btn-danger mb-3">Adopt Rocky</a>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <div class="dog-card">
                <img src="https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRp-KOty1cZwZ9dtkEVNr79G4p7x8am3q4eTmngCou0twaqdsO9inHlC3bDydqYkB4tP-jaPvFk5ajQydudeiMblw" alt="Bella the Dog" />
                <h3>Bella</h3>
                <p>Gentle Golden Retriever, 2.5 years old.</p>
                <a href="dog4.html" class="btn btn-danger mb-3">Adopt Bella</a>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <div class="dog-card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-52t7IBIliAoKPXBTwCl8i9RnW2mrs3c74g&s" alt="Charlie the Husky" />
                <h3>Charlie</h3>
                <p>Curious Husky, 1.5 years old.</p>
                <a href="dog5.html" class="btn btn-danger mb-3">Adopt Charlie</a>
            </div>
        </div>

    </div>
</section>

<!-- Adoption Section -->
<section class="adoption-section">
    <h2 class="text-danger fw-bold fs-2 mb-4 text-uppercase">Adoption Process</h2>
    <p>We make adoption simple and loving 💕. Click the button below, fill the form, and our team will contact you within 24 hours to guide you through the process.</p>
    <a href="adoption.html" class="btn btn-danger btn-lg px-4"><i class="fas fa-paw me-2"></i>Fill Adoption Form</a>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="social-links mb-3">
            <a href="https://facebook.com" target="_blank" class="social-btn fb"><i class="fab fa-facebook-f"></i></a>
            <a href="https://instagram.com" target="_blank" class="social-btn ig"><i class="fab fa-instagram"></i></a>
            <a href="https://wa.me/9779800000000" target="_blank" class="social-btn wa"><i class="fab fa-whatsapp"></i></a>
        </div>
        <p>&copy; 2025 Happy Tails Adoption | Made with ❤ in Nepal</p>
    </div>
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
