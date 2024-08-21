<?php
include "headers.php";

class User
{
  function login($json)
  {
    // {"username":"admin","password":"admin"}
    include "connection.php";
    $json = json_decode($json, true);
    $sql = "SELECT * FROM tbl_user WHERE user_username = :username  AND BINARY user_password = :password";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $json['username']);
    $stmt->bindParam(':password', $json['password']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetch(PDO::FETCH_ASSOC)) : 0;
  }

  function signup($json)
  {
    // example data 
    // {"personalInfo":{"firstName":"Mel Angelo","lastName":"Macario","middleName":"Sabido","email":"xmoonlightboy@gmail.com","alternateEmail":"xmoonlightboy@gmail.com","contact":"09676887868","alternateContact":"09676887868","presentAddress":"balay","permanentAddress":"admin","gender":"Female","dob":"2024-08-07","sss":"123","tin":"123","philhealth":"123","pagibig":"123","password":"melmacs","confirmPassword":"admin"},
    // "educationalBackground":[{"institution":1,"course":32,"courseDateGraduated":"2024-07-31","graduateCourse":3,"graduateCourseDate":"2024-08-13","prcLicense":"License mo to","prcLicenseNumber":"123123"},{"institution":9,"course":33,"courseDateGraduated":"2024-08-01","graduateCourse":2,"graduateCourseDate":"2024-08-15","prcLicense":"License mo to","prcLicenseNumber":"123123"},{"institution":2,"course":34,"courseDateGraduated":"2024-08-03","graduateCourse":1,"graduateCourseDate":"2001-03-14","prcLicense":"License mo to","prcLicenseNumber":"123123"}],
    // "employmentHistory":[{"position":"123","company":"123","startDate":"2024-08-07","endDate":"2024-08-15"},{"position":"asd","company":"qwe","startDate":"2024-08-08","endDate":"2024-08-15"},{"position":"123","company":"qweqwe","startDate":"2024-08-01","endDate":"2024-08-19"}],
    // "skills":[{"skills":2},{"skills":5},{"skills":1},{"skills":7},{"skills":3}],
    // "trainings":[{"training":1},{"training":4},{"training":2},{"training":3}],
    // "positionId": "1",
    // "isSubscribeToEmail":"false"}
    include "connection.php";
    $conn->beginTransaction();
    try {
      $json = json_decode($json, true);
      $personalInformation = $json['personalInfo'];
      $educationalBackground = $json['educationalBackground'];
      $employmentHistory = $json['employmentHistory'];
      $skills = $json['skills'];
      $trainings = $json['trainings'];

      $sql = "INSERT INTO tbl_personal_information ( 
              last_name, first_name, middle_name, contact_number, 
              alternate_contact_number, email, alternate_email, 
              present_address, permanent_address, date_of_birth, sex, sss_number, 
              tin_number, philhealth_number, pagibig_number, personal_password) 
              VALUES (:last_name, :first_name, :middle_name, :contact_number, 
              :alternate_contact_number, :email, :alternate_email, 
              :present_address, :permanent_address, :date_of_birth, :sex, :sss_number, 
              :tin_number, :philhealth_number, :pagibig_number, :personal_password)";
      $stmt = $conn->prepare($sql);

      $stmt->bindParam(':last_name', $personalInformation['lastName']);
      $stmt->bindParam(':first_name', $personalInformation['firstName']);
      $stmt->bindParam(':middle_name', $personalInformation['middleName']);
      $stmt->bindParam(':contact_number', $personalInformation['contact']);
      $stmt->bindParam(':alternate_contact_number', $personalInformation['alternateContact']);
      $stmt->bindParam(':email', $personalInformation['email']);
      $stmt->bindParam(':alternate_email', $personalInformation['alternate_email']);
      $stmt->bindParam(':present_address', $personalInformation['presentAddress']);
      $stmt->bindParam(':permanent_address', $personalInformation['permanentAddress']);
      $stmt->bindParam(':date_of_birth', $personalInformation['dob']);
      $stmt->bindParam(':sex', $personalInformation['gender']);
      $stmt->bindParam(':sss_number', $personalInformation['sss']);
      $stmt->bindParam(':tin_number', $personalInformation['tin']);
      $stmt->bindParam(':philhealth_number', $personalInformation['philhealth']);
      $stmt->bindParam(':pagibig_number', $personalInformation['pagibig']);
      $stmt->bindParam(':personal_password', $personalInformation['password']);
      $stmt->execute();
      $newId = $conn->lastInsertId();
      if ($stmt->rowCount() > 0) {
        $sql = "INSERT INTO tbl_educational_background (
                  personal_info_id, courses_id, course_date_graduated, course_graduate_id, institution_id, date_of_graduation, prc_license, prc_license_number) 
                  VALUES (:personal_info_id, :courses_id, :course_date_graduated, :course_graduate_id, :institution_id, :date_of_graduation, :prc_license, :prc_license_number)";
        foreach ($educationalBackground as $item) {
          $stmt = $conn->prepare($sql);
          $stmt->bindParam(':personal_info_id', $newId);
          $stmt->bindParam(':courses_id', $item['course']);
          $stmt->bindParam(':course_date_graduated', $item['courseDateGraduated']);
          $stmt->bindParam(':course_graduate_id', $item['graduateCourse']);
          $stmt->bindParam(':institution_id', $item['institution']);
          $stmt->bindParam(':date_of_graduation', $item['graduateCourseDate']);
          $stmt->bindParam(':prc_license', $item['prcLicense']);
          $stmt->bindParam(':prc_license_number', $item['prcLicenseNumber']);
          $stmt->execute();
        }
        if ($stmt->rowCount() > 0) {
          $sql = "INSERT INTO tbl_employment_history ( 
                    personal_info_id, employment_position_name, employment_company_name, employment_start_date, employment_end_date) 
                    VALUES (:personal_info_id, :employment_position_name, :employment_company_name, :employment_start_date, :employment_end_date)";
          foreach ($employmentHistory as $item) {
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':personal_info_id', $newId);
            $stmt->bindParam(':employment_position_name', $item['position']);
            $stmt->bindParam(':employment_company_name', $item['company']);
            $stmt->bindParam(':employment_start_date', $item['startDate']);
            $stmt->bindParam(':employment_end_date', $item['endDate']);
            $stmt->execute();
          }

          if ($stmt->rowCount() > 0) {
            $sql = "INSERT INTO tbl_training (personal_info_id, personal_training_id) 
                    VALUES (:personal_info_id, :personal_training_id)";
            foreach ($trainings as $item) {
              $stmt = $conn->prepare($sql);
              $stmt->bindParam(':personal_info_id', $newId);
              $stmt->bindParam(':personal_training_id', $item['training']);
              $stmt->execute();
            }

            if ($stmt->rowCount() > 0) {
              $sql = "INSERT INTO tbl_skills(personal_info_id, personal_skills_id) 
                      VALUES (:personal_info_id, :personal_skill_id)";
              foreach ($skills as $item) {
                $stmt = $conn->prepare($sql);
                $stmt->bindParam(':personal_info_id', $newId);
                $stmt->bindParam(':personal_skill_id', $item['skills']);
                $stmt->execute();
              }
              if ($stmt->rowCount() > 0) {
                $sql = "INSERT INTO tbl_position_applied (
                  personal_info_id, apply_position_id)
                  VALUES (:personal_info_id, :apply_position_id)";
                $stmt = $conn->prepare($sql);
                $stmt->bindParam(':personal_info_id', $newId);
                $stmt->bindParam(':apply_position_id', $json['positionId']);
                $stmt->execute();
                if ($stmt->rowCount() > 0) {
                  $sql = "INSERT INTO tbl_consent(personal_info_id, subscribe_to_email_updates) 
                      VALUES (:personal_info_id, :subscribe_to_email_updates)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':personal_info_id', $newId);
                  $stmt->bindParam(':subscribe_to_email_updates', $json['isSubscribeToEmail']);
                  $stmt->execute();
                  if ($stmt->rowCount() > 0) {
                    $conn->commit();
                    return 1;
                  }
                }
              }
            }
          }
        }
      }
    } catch (PDOException $th) {
      $conn->rollBack();
      return $th;
    }
  }

  function getInstitution()
  {
    include "connection.php";
    $sql = "SELECT * FROM tbl_institution";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function getCourses()
  {
    include "connection.php";
    $sql = "SELECT * FROM tbl_courses";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function getCourseGraduate()
  {
    include "connection.php";
    $sql = "SELECT * FROM tbl_course_graduate";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function getPinCode($json)
  {
    // {"email": "qkyusans@gmail"}
    include "connection.php";
    include "send_email.php";

    $data = json_decode($json, true);
    if (recordExists($data['email'], "tbl_personal_information", "email")) return -1;

    $firstLetter = strtoupper(substr($data['email'], 0, 1));
    $thirdLetter = strtoupper(substr($data['email'], 2, 1));
    $pincode = $firstLetter . rand(100, 999) . $thirdLetter . rand(10000, 99999);

    $currentDateTime = new DateTime("now", new DateTimeZone('Asia/Manila'));
    $expirationDateTime = $currentDateTime->add(new DateInterval('PT15M'));
    $expirationTimestamp = $expirationDateTime->format('Y-m-d H:i:s');

    // $sql = "INSERT INTO tbl_pincode (pin_email, pin_code, pin_expiration_date) VALUES (:email, :pincode, :pin_expiration_date)";
    // $stmt = $conn->prepare($sql);
    // $stmt->bindParam(':email', $data['email']);
    // $stmt->bindParam(':pincode', $pincode);
    // $stmt->bindParam(':pin_expiration_date', $expirationTimestamp);
    // $stmt->execute();
    $sendEmail = new SendEmail();
    $sendEmail->sendEmail($data['email'], $pincode . " - Your PIN Code", "Please use the following code to complete the first step:<br /><br /> <b>$pincode</b>");

    return json_encode(["pincode" => $pincode, "expirationDate" => $expirationTimestamp]);
  }
  function getSkills()
  {
    include "connection.php";
    $sql = "SELECT * FROM tbl_personal_skills";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function getActiveJob()
  {
    include "connection.php";
    $sql = "SELECT a.*, COUNT(b.apply_position_id) as Total_Applied 
              FROM tbl_apply_position a  
              LEFT JOIN tbl_position_applied b 
              ON a.apply_position_id = b.apply_position_id 
              WHERE a.apply_position_status = 1 
              GROUP BY a.apply_position_id ";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function isEmailExist($json)
  {
    // {"email": "qkyusans@gmail"}
    include "connection.php";
    $data = json_decode($json, true);
    if (recordExists($data['email'], "tbl_personal_information", "email")) {
      return -1;
    } else {
      return 1;
    }
  }

  function getAllDataForDropdownSignup()
  {
    include "connection.php";
    $conn->beginTransaction();
    try {
      $data = [];

      $sql = "SELECT * FROM tbl_institution";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['institution'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tbl_courses";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['courses'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tbl_course_graduate";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['courseGraduate'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tbl_personal_skills";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['skills'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tbl_personal_training";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['training'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $conn->commit();

      return json_encode($data);
    } catch (\Throwable $th) {
      $conn->rollBack();
      return 0;
    }
  }
} //user

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
          $fileDestination =  'images/' . $fileNameNew;
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

$input = json_decode(file_get_contents('php://input'), true);
$json = isset($_POST["json"]) ? $_POST["json"] : "0";
$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";

$user = new User();

switch ($operation) {
  case "login":
    echo $user->login($json);
    break;
  case "signup":
    echo $user->signup($json);
    break;
  case "getInstitution":
    echo $user->getInstitution();
    break;
  case "getCourses":
    echo $user->getCourses();
    break;
  case "getPinCode":
    echo $user->getPinCode($json);
    break;
  case "getActiveJob":
    echo $user->getActiveJob();
    break;
  case "getSkills":
    echo $user->getSkills();
    break;
  case "isEmailExist":
    echo $user->isEmailExist($json);
    break;
  case "getCourseGraduate":
    echo $user->getCourseGraduate($json);
    break;
  case "getAllDataForDropdownSignup":
    echo $user->getAllDataForDropdownSignup();
    break;
  default:
    echo "WALA KA NAGBUTANG OG OPERATION SA UBOS HAHAHHA BOBO";
    break;
}
