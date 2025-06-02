<?php
$allowedOrigins = [
    'http://localhost:3000',
    'https://delmonte-careers.vercel.app'
];

if (isset($_SERVER['HTTP_ORIGIN']) && in_array($_SERVER['HTTP_ORIGIN'], $allowedOrigins)) {
    header("Access-Control-Allow-Origin: " . $_SERVER['HTTP_ORIGIN']);
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Methods: GET, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");
}

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit;
}

$file = $_GET['file'] ?? '';

$uploadsDir = __DIR__ . '/uploads/';
$filePath = realpath($uploadsDir . basename($file));

if (!$filePath || strpos($filePath, realpath($uploadsDir)) !== 0 || !file_exists($filePath)) {
    http_response_code(404);
    echo json_encode(["error" => "File not found."]);
    exit;
}

$extension = pathinfo($filePath, PATHINFO_EXTENSION);
$contentType = match (strtolower($extension)) {
    'pdf' => 'application/pdf',
    'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    default => 'application/octet-stream'
};

header("Content-Type: $contentType");
header("Content-Disposition: inline; filename=\"$file\"");
readfile($filePath);
exit;
