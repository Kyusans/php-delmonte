<?php
include "headers.php";


class Manager
{
  function getUnfitMedicalCandidates(){
    include "connection.php";
    $sql = 'SELECT a.medicalM_id, a.medicalM_jobMId, a.medicalM_candId, CONCAT(c.cand_lastname, ", ", c.cand_middlename, " ",c.cand_firstname) as cand_fullName, CONCAT(d.hr_lastname, ", ", d.hr_firstname, " ",d.hr_middlename) as hr_fullName,  b.medicalC_type, b.medicalC_name FROM tblmedicalmaster a
            INNER JOIN tblmedicalclassification b ON b.medicalC_id = a.medicalM_medicalCId
            INNER JOIN tblcandidates c ON c.cand_id = a.medicalM_candId
            INNER JOIN tblhr d ON d.hr_id = a.medicalM_hrId
            WHERE a.medicalM_medicalCId > 2';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

} //manager

function recordExists($value, $table, $column)
{
  include "connection.php";
  $sql = "SELECT COUNT(*) FROM $table WHERE $column = :value";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(":value", $value);
  $stmt->execute();
  $count = $stmt->fetchColumn();
  return $count > 0;
}


function uploadImage()
{
  if (isset($_FILES["file"])) {
    $file = $_FILES['file'];
    // print_r($file);
    $fileName = $_FILES['file']['name'];
    $fileTmpName = $_FILES['file']['tmp_name'];
    $fileSize = $_FILES['file']['size'];
    $fileError = $_FILES['file']['error'];
    // $fileType = $_FILES['file']['type'];

    $fileExt = explode(".", $fileName);
    $fileActualExt = strtolower(end($fileExt));

    $allowed = ["jpg", "jpeg", "png"];

    if (in_array($fileActualExt, $allowed)) {
      if ($fileError === 0) {
        if ($fileSize < 25000000) {
          $fileNameNew = uniqid("", true) . "." . $fileActualExt;
          $fileDestination = 'images/' . $fileNameNew;
          move_uploaded_file($fileTmpName, $fileDestination);
          return $fileNameNew;
        } else {
          return 4;
        }
      } else {
        return 3;
      }
    } else {
      return 2;
    }
  } else {
    return "";
  }
}

function getCurrentDate()
{
  $today = new DateTime("now", new DateTimeZone('Asia/Manila'));
  return $today->format('Y-m-d h:i:s A');
}

$json = $_POST["json"] ?? "0";
$operation = $_POST["operation"] ?? "0";

$manager = new Manager();

switch ($operation) {
  case "getUnfitMedicalCandidates":
    echo json_encode($manager->getUnfitMedicalCandidates());
    break;
  default:
    echo json_encode("WALA KA NAGBUTANG OG OPERATION SA UBOS HAHAHHA BOBO");
    http_response_code(400); // Bad Request
    break;
}