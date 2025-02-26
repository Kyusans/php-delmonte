<?php
use \Firebase\JWT\JWT;

require 'vendor/autoload.php';

const SECRET_KEY = 'your_secret_key'; // Replace with a strong secret key

// Generate JWT
function generate_jwt($payload)
{
    return JWT::encode($payload, SECRET_KEY, 'HS256');
}

// Verify JWT
function verify_jwt($token)
{
    try {
        return JWT::decode($token, SECRET_KEY, ['HS256']);
    } catch (Exception $e) {
        return false;
    }
}
?>
