<?php
include "headers.php";


class User
{
  // function login($json)
  // {
  //   // {"username":"admin","password":"admin"}
  //   include "connection.php";
  //   $json = json_decode($json, true);
  //   $sql = "SELECT * FROM tbl_personal_information WHERE email = :username  AND BINARY personal_password = :password";
  //   $stmt = $conn->prepare($sql);
  //   $stmt->bindParam(':username', $json['username']);
  //   $stmt->bindParam(':password', $json['password']);
  //   $stmt->execute();
  //   return $stmt->rowCount() > 0 ? json_encode($stmt->fetch(PDO::FETCH_ASSOC)) : 0;
  // }

  function login($json)
{
    include "connection.php";
    // include "jwt_utils.php";

    $json = json_decode($json, true);


    $sql = "SELECT a.adm_id, a.adm_name, a.adm_email, a.adm_password, b.userL_level AS adm_userLevel FROM tbladmin a
            INNER JOIN tbluserlevel b ON a.adm_userLevel = b.userL_id
            WHERE BINARY adm_email = :username AND BINARY adm_password = :password";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $json['username']);
    $stmt->bindParam(':password', $json['password']);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        return json_encode([
            'adm_id' => $user['adm_id'],
            'adm_userLevel' => $user['adm_userLevel'],
            'adm_name' => $user['adm_name'],
            'adm_email' => $user['adm_email']
        ]);
    }


    $sql = "SELECT * FROM tblsupervisor WHERE BINARY sup_email = :username AND BINARY sup_password = :password";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $json['username']);
    $stmt->bindParam(':password', $json['password']);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        return json_encode([
            'sup_id' => $user['sup_id'],
            'sup_user_level' => $user['sup_user_level'],
            'sup_name' => $user['sup_name'],
            'sup_email' => $user['sup_email']
        ]);
    }


    $sql = "SELECT a.cand_id, a.cand_firstname, a.cand_lastname, a.cand_email, b.userL_level AS cand_userLevel FROM tblcandidates a
    INNER JOIN tbluserlevel b ON a.cand_userLevel = b.userL_id
    WHERE BINARY a.cand_email = :username AND BINARY a.cand_password = :password";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $json['username']);
    $stmt->bindParam(':password', $json['password']);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        return json_encode([
            'cand_id' => $user['cand_id'],
            'cand_firstname' => $user['cand_firstname'],
            'cand_lastname' => $user['cand_lastname'],
            'cand_email' => $user['cand_email'],
            'cand_userLevel' => $user['cand_userLevel']
        ]);
    }

    return json_encode(null);
}

// function login($json)
// {
//     include "connection.php";
//     include "jwt_utils.php";


//     $json = json_decode($json, true);
//     $username = $json['username'];
//     $password = $json['password'];

//     // Admin Login
//     $sql = "SELECT a.adm_id, a.adm_name, a.adm_email, b.userL_level AS adm_userLevel
//             FROM tbladmin a
//             INNER JOIN tbluserlevel b ON a.adm_userLevel = b.userL_id
//             WHERE BINARY adm_email = :username AND BINARY adm_password = :password";
//     $stmt = $conn->prepare($sql);
//     $stmt->bindParam(':username', $username);
//     $stmt->bindParam(':password', $password);
//     $stmt->execute();

//     if ($stmt->rowCount() > 0) {
//         $user = $stmt->fetch(PDO::FETCH_ASSOC);

//         // Generate JWT
//         $token = generate_jwt([
//             'id' => $user['adm_id'],
//             'name' => $user['adm_name'],
//             'email' => $user['adm_email'],
//             'userLevel' => $user['adm_userLevel'],
//             'exp' => time() + 3600 // 1 hour expiry
//         ]);

//         // Set JWT as an HTTP-only cookie
//         setcookie('token', $token, [
//             'expires' => time() + 3600,
//             'httponly' => true,
//             'secure' => true, // Ensure HTTPS
//             'samesite' => 'Strict'
//         ]);

//         return json_encode(['success' => true, 'message' => 'Login successful']);
//     }

//     // Supervisor Login
//     $sql = "SELECT * FROM tblsupervisor WHERE BINARY sup_email = :username AND BINARY sup_password = :password";
//     $stmt = $conn->prepare($sql);
//     $stmt->bindParam(':username', $username);
//     $stmt->bindParam(':password', $password);
//     $stmt->execute();

//     if ($stmt->rowCount() > 0) {
//         $user = $stmt->fetch(PDO::FETCH_ASSOC);

//         // Generate JWT
//         $token = generate_jwt([
//             'id' => $user['sup_id'],
//             'name' => $user['sup_name'],
//             'email' => $user['sup_email'],
//             'userLevel' => $user['sup_user_level'],
//             'exp' => time() + 3600
//         ]);

//         // Set JWT as an HTTP-only cookie
//         setcookie('token', $token, [
//             'expires' => time() + 3600,
//             'httponly' => true,
//             'secure' => true,
//             'samesite' => 'Strict'
//         ]);

//         return json_encode(['success' => true, 'message' => 'Login successful']);
//     }

//     // Candidate Login
//     $sql = "SELECT a.cand_id, a.cand_firstname, a.cand_lastname, a.cand_email, b.userL_level AS cand_userLevel
//             FROM tblcandidates a
//             INNER JOIN tbluserlevel b ON a.cand_userLevel = b.userL_id
//             WHERE BINARY a.cand_email = :username AND BINARY a.cand_password = :password";
//     $stmt = $conn->prepare($sql);
//     $stmt->bindParam(':username', $username);
//     $stmt->bindParam(':password', $password);
//     $stmt->execute();

//     if ($stmt->rowCount() > 0) {
//         $user = $stmt->fetch(PDO::FETCH_ASSOC);

//         // Generate JWT
//         $token = generate_jwt([
//             'id' => $user['cand_id'],
//             'firstname' => $user['cand_firstname'],
//             'lastname' => $user['cand_lastname'],
//             'email' => $user['cand_email'],
//             'userLevel' => $user['cand_userLevel'],
//             'exp' => time() + 3600
//         ]);

//         // Set JWT as an HTTP-only cookie
//         setcookie('token', $token, [
//             'expires' => time() + 3600,
//             'httponly' => true,
//             'secure' => true,
//             'samesite' => 'Strict'
//         ]);

//         return json_encode(['success' => true, 'message' => 'Login successful']);
//     }

//     return json_encode(['success' => false, 'message' => 'Invalid credentials']);
// }

// function signup($json)
// {
//   include "connection.php";
//   $conn->beginTransaction();
//   try {
//     $json = json_decode($json, true);
//     $personalInformation = $json['personalInfo'];
//     $educationalBackground = $json['educationalBackground'] ?? [];
//     $employmentHistory = $json['employmentHistory'] ?? [];
//     $skills = $json['skills'] ?? [];
//     $trainings = $json['trainings'] ?? [];
//     $knowledge = $json['knowledge'] ?? [];
//     $licenses = $json['licenses'] ?? [];
//     $createdDateTime = getCurrentDate();
//     $isSubscribeToEmail = $json['isSubscribeToEmail'] ?? 0;
//     // return json_encode($json);
//     // die();
//     $sql = "INSERT INTO tblcandidates(cand_lastname, cand_firstname, cand_middlename, cand_contactNo,
//               cand_alternateContactNo, cand_email, cand_alternateEmail, cand_presentAddress,
//               cand_permanentAddress, cand_dateofBirth, cand_sex, cand_sssNo, cand_tinNo,
//               cand_philhealthNo, cand_pagibigNo, cand_password, cand_createdDatetime)
//               VALUES(:last_name, :first_name, :middle_name, :contact_number, :alternate_contact_number,
//               :email, :alternate_email, :present_address, :permanent_address, :date_of_birth,
//               :sex, :sss_number, :tin_number, :philhealth_number, :pagibig_number,
//               :personal_password, :created_datetime)";
//     $stmt = $conn->prepare($sql);

//     $stmt->bindParam(':last_name', $personalInformation['lastName']);
//     $stmt->bindParam(':first_name', $personalInformation['firstName']);
//     $stmt->bindParam(':middle_name', $personalInformation['middleName']);
//     $stmt->bindParam(':contact_number', $personalInformation['contact']);
//     $stmt->bindParam(':alternate_contact_number', $personalInformation['alternateContact']);
//     $stmt->bindParam(':email', $personalInformation['email']);
//     $stmt->bindParam(':alternate_email', $personalInformation['alternateEmail']);
//     $stmt->bindParam(':present_address', $personalInformation['presentAddress']);
//     $stmt->bindParam(':permanent_address', $personalInformation['permanentAddress']);
//     $stmt->bindParam(':date_of_birth', $personalInformation['dob']);
//     $stmt->bindParam(':sex', $personalInformation['gender']);
//     $stmt->bindParam(':sss_number', $personalInformation['sss']);
//     $stmt->bindParam(':tin_number', $personalInformation['tin']);
//     $stmt->bindParam(':philhealth_number', $personalInformation['philhealth']);
//     $stmt->bindParam(':pagibig_number', $personalInformation['pagibig']);
//     $stmt->bindParam(':personal_password', $personalInformation['password']);
//     $stmt->bindParam(':created_datetime', $createdDateTime);
//     $stmt->execute();
//     $newId = $conn->lastInsertId();

//     if ($stmt->rowCount() > 0) {
//       if (!empty($educationalBackground)) {
//         $sql = "INSERT INTO tblcandeducbackground (educ_canId, educ_coursesId, educ_institutionId, educ_dateGraduate)
//         VALUES (:personal_info_id, :educational_courses_id, :educational_institution_id, :educational_date_graduate)";

//         foreach ($educationalBackground as $item) {
//           $stmt = $conn->prepare($sql);
//           $stmt->bindParam(':personal_info_id', $newId);
//           $stmt->bindParam(':educational_courses_id', $item['course']);
//           $stmt->bindParam(':educational_institution_id', $item['institution']);
//           $stmt->bindParam(':educational_date_graduate', $item['courseDateGraduated']);
//           $stmt->execute();
//         }
//       }

//       if ($stmt->rowCount() > 0 && !empty($employmentHistory)) {
//         $sql = "INSERT INTO tblcandemploymenthistory(empH_candId , empH_positionName, empH_companyName,
//                       empH_startDate, empH_endDate) VALUES (:personal_info_id, :employment_position_name,
//                       :employment_company_name, :employment_start_date, :employment_end_date)";
//         foreach ($employmentHistory as $item) {
//           $stmt = $conn->prepare($sql);
//           $stmt->bindParam(':personal_info_id', $newId);
//           $stmt->bindParam(':employment_position_name', $item['position']);
//           $stmt->bindParam(':employment_company_name', $item['company']);
//           $stmt->bindParam(':employment_start_date', $item['startDate']);
//           $stmt->bindParam(':employment_end_date', $item['endDate']);
//           $stmt->execute();
//         }
//       }

//       if ($stmt->rowCount() > 0 && !empty($trainings)) {
//         $sql = "INSERT INTO tblcandtraining (training_candId , training_perTId )
//                       VALUES (:personal_info_id, :personal_training_id)";
//         foreach ($trainings as $item) {
//           $stmt = $conn->prepare($sql);
//           $stmt->bindParam(':personal_info_id', $newId);
//           $stmt->bindParam(':personal_training_id', $item['training']);
//           $stmt->execute();
//         }
//       }

//       if ($stmt->rowCount() > 0 && !empty($skills)) {
//         $sql = "INSERT INTO tblcandskills(skills_candId , skills_perSId)
//                       VALUES (:personal_info_id, :personal_skill_id)";
//         foreach ($skills as $item) {
//           $stmt = $conn->prepare($sql);
//           $stmt->bindParam(':personal_info_id', $newId);
//           $stmt->bindParam(':personal_skill_id', $item['skills']);
//           $stmt->execute();
//         }
//       }

//       if ($stmt->rowCount() > 0 && !empty($knowledge)) {
//         $sql = "INSERT INTO tblcandknowledge(canknow_canId , canknow_knowledgeId)
//                       VALUES (:personal_info_id, :personal_knowledge_id)";
//         foreach ($knowledge as $item) {
//           $stmt = $conn->prepare($sql);
//           $stmt->bindParam(':personal_info_id', $newId);
//           $stmt->bindParam(':personal_knowledge_id', $item['knowledge']);
//           $stmt->execute();
//         }
//       }

//       if ($stmt->rowCount() > 0 && !empty($licenses)) {
//         $sql = "INSERT INTO tblcandlicense(license_number, license_canId, license_masterId)
//                 VALUES (:license_number, :license_canId, :license_masterId)";
//         foreach ($licenses as $item) {
//           $stmt = $conn->prepare($sql);
//           $stmt->bindParam(':license_number', $item['licenseNumber']);
//           $stmt->bindParam(':license_canId', $newId);
//           $stmt->bindParam(':license_masterId', $item['license']);
//           $stmt->execute();
//         }
//       }

//       if ($stmt->rowCount() > 0 && !empty($isSubscribeToEmail)) {
//         $sql = "INSERT INTO tblcandconsent(cons_candId , cons_subscribetoemailupdates)
//         VALUES (:personal_info_id, :personal_subscribe_to_email)";
//         $stmt = $conn->prepare($sql);
//         $stmt->bindParam(':personal_info_id', $newId);
//         $stmt->bindParam(':personal_subscribe_to_email', $isSubscribeToEmail);
//         $stmt->execute();
//       }

//       if ($stmt->rowCount() > 0) {
//         $conn->commit();
//         return 1;
//       }
//     }
//   } catch (PDOException $th) {
//     $conn->rollBack();
//     return $th;
//   }
// }


function signup($json)
  {
    // {"lastName":"Bautista","firstName":"John","middleName":"Dela","contact":"09123456789","alternateContact":"09123456789","email":"johnbautista@gmail.com","alternateEmail":"johnbautista@gmail.com","presentAddress":"Manila","permanentAddress":"Manila","dob":"1990-01-01","gender":"Male","password":"password"}
    include "connection.php";
    $data = json_decode($json, true);
    $createdDateTime = getCurrentDate();
    $sql = "INSERT INTO tblcandidates(cand_lastname, cand_firstname, cand_middlename, cand_contactNo,
                cand_alternateContactNo, cand_email, cand_alternateEmail, cand_presentAddress,
                cand_permanentAddress, cand_dateofBirth, cand_sex, cand_password, cand_createdDatetime, cand_userLevel)
                VALUES(:last_name, :first_name, :middle_name, :contact_number, :alternate_contact_number,
                :email, :alternate_email, :present_address, :permanent_address, :date_of_birth,
                :sex, :personal_password, :created_datetime, 1)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':last_name', $data['lastName']);
    $stmt->bindParam(':first_name', $data['firstName']);
    $stmt->bindParam(':middle_name', $data['middleName']);
    $stmt->bindParam(':contact_number', $data['contact']);
    $stmt->bindParam(':alternate_contact_number', $data['alternateContact']);
    $stmt->bindParam(':email', $data['email']);
    $stmt->bindParam(':alternate_email', $data['alternateEmail']);
    $stmt->bindParam(':present_address', $data['presentAddress']);
    $stmt->bindParam(':permanent_address', $data['permanentAddress']);
    $stmt->bindParam(':date_of_birth', $data['dob']);
    $stmt->bindParam(':sex', $data['gender']);
    $stmt->bindParam(':personal_password', $data['password']);
    $stmt->bindParam(':created_datetime', $createdDateTime);
    $stmt->execute();

    return $stmt->rowCount() > 0 ? 1 : 0;
  }

function getInstitution()
{
  include "connection.php";
  $sql = "SELECT * FROM tblinstitution";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function getCourses()
{
  include "connection.php";
  $sql = "SELECT * FROM tblcourses";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function getCourseType()
{
  include "connection.php";
  $sql = "SELECT * FROM tblcoursetype";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function getCourseCategory()
{
  include "connection.php";
  $sql = "SELECT * FROM tblcoursescategory";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function getKnowledge(){
  include "connection.php";
  $sql = "SELECT * FROM tblpersonalknowledge";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function getLicense()
{
  include "connection.php";
  $sql = "SELECT * FROM tbllicensemaster";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function getLicenseType()
{
  include "connection.php";
  $sql = "SELECT * FROM tbllicensetype";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

// function getPinCodeUpdate($json)
// {
//     // {"email": "qkyusans@gmail.com"}
//     include "connection.php";
//     include "send_email.php";

//     $data = json_decode($json, true);
//     $email = $data['email'];

//     // Check if the email exists in either the primary or alternate email fields
//     if (!recordExists($email, "tblcandidates", "cand_email, cand_alternateEmail")) {
//         // Email doesn't exist, return an error if necessary
//         return json_encode(["error" => "Email not found in the system."]);
//     }

//     // Generate a PIN code using parts of the email
//     $firstLetter = strtoupper(substr($email, 0, 1));
//     $thirdLetter = strtoupper(substr($email, 2, 1));
//     $pincode = $firstLetter . rand(100, 999) . $thirdLetter . rand(10000, 99999);

//     // Set expiration time (15 minutes from now)
//     $currentDateTime = new DateTime("now", new DateTimeZone('Asia/Manila'));
//     $expirationDateTime = $currentDateTime->add(new DateInterval('PT15M'));
//     $expirationTimestamp = $expirationDateTime->format('Y-m-d H:i:s');

//     // Send email with the PIN code
//     $sendEmail = new SendEmail();
//     $sendEmail->sendEmail($email, "$pincode - Your PIN Code", "Please use the following code:<br /><br /> <b>$pincode</b>");

//     // Return the generated PIN code and its expiration date
//     return json_encode(["pincode" => $pincode, "expirationDate" => $expirationTimestamp]);
// }

function getPinCodeUpdate($json)
{

    include "connection.php";
    include "send_email.php";

    $data = json_decode($json, true);
    $email = $data['email'];


    $sql = "SELECT cand_id, cand_email, cand_alternateEmail FROM tblcandidates WHERE cand_email = :email OR cand_alternateEmail = :email";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $email, PDO::PARAM_STR);
    $stmt->execute();


    $candidate = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$candidate) {
        return json_encode(["error" => "Email not found in the system."]);
    }


    $cand_id = $candidate['cand_id'];


    $firstLetter = strtoupper(substr($email, 0, 1));
    $thirdLetter = strtoupper(substr($email, 2, 1));
    $pincode = $firstLetter . rand(100, 999) . $thirdLetter . rand(10000, 99999);


    $currentDateTime = new DateTime("now", new DateTimeZone('Asia/Manila'));
    $expirationDateTime = $currentDateTime->add(new DateInterval('PT15M'));
    $expirationTimestamp = $expirationDateTime->format('Y-m-d H:i:s');


    $sendEmail = new SendEmail();
    $sendEmail->sendEmail($email, "$pincode - Your PIN Code", "Please use the following code:<br /><br /> <b>$pincode</b>");

    return json_encode([
        "pincode" => $pincode,
        "expirationDate" => $expirationTimestamp,
        "cand_id" => $cand_id
    ]);
}

function getPinCodeEmailUpdate($json) {
  include "connection.php";
  include "send_email.php";

  $data = json_decode($json, true);


  $newEmail = $data['newEmail'];


  if (empty($newEmail)) {
      return json_encode(["error" => "New email not provided"]);
  }

  $firstLetter = strtoupper(substr($newEmail, 0, 1)); // Change to newEmail
  $thirdLetter = strtoupper(substr($newEmail, 2, 1)); // Change to newEmail
  $pincode = $firstLetter . rand(100, 999) . $thirdLetter . rand(10000, 99999);

  $currentDateTime = new DateTime("now", new DateTimeZone('Asia/Manila'));
  $expirationDateTime = $currentDateTime->add(new DateInterval('PT15M')); // 15 minutes validity
  $expirationTimestamp = $expirationDateTime->format('Y-m-d H:i:s');

  $sendEmail = new SendEmail();
  $sendEmail->sendEmail($newEmail, $pincode . " - Your PIN Code", "Please use the following code to confirm your new email:<br /><br /><b>$pincode</b>");

  return json_encode(["pincode" => $pincode, "expirationDate" => $expirationTimestamp]);
}






function getPinCode($json)
  {
    // {"email": "qkyusans@gmail"}
    include "connection.php";
    include "send_email.php";

    $data = json_decode($json, true);
    if (recordExists($data['email'], "tblcandidates", "email")) return -1;

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
  $sql = "SELECT * FROM tblpersonalskills";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function getTraining()
{
  include "connection.php";
  $sql = "SELECT * FROM tblpersonaltraining";
  $stmt = $conn->prepare($sql);
  $stmt->execute();
  return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
}

function isEmailExist($json)
  {
    // {"email": "qkyusans@gmail"}
    include "connection.php";
    $data = json_decode($json, true);
    if (recordExists($data['email'], "tblcandidates", "cand_email ")) {
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

      $sql = "SELECT * FROM tblinstitution";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['institution'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tblcourses";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['courses'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tblcoursetype";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['courseType'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tblpersonalskills";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['skills'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tblpersonaltraining";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['training'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tblpersonalknowledge";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['knowledge'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tbllicensemaster";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['license'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT * FROM tbllicensetype";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['licenseType'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $conn->commit();

      return json_encode($data);
    } catch (\Throwable $th) {
      $conn->rollBack();
      return 0;
    }
  }

  function sendEmail($json)
  {
    include "send_email.php";
    // {"emailToSent":"xhifumine@gmail.com","emailSubject":"Kunwari MESSAGE","emailBody":"Kunwari message ni diri hehe <b>102345</b>"}
    $data = json_decode($json, true);
    $sendEmail = new SendEmail();
    return $sendEmail->sendEmail($data['emailToSent'], $data['emailSubject'], $data['emailBody']);
  }


  // function getCandidatesProfile(){
  //   include "connection.php";

  //   $sql = "SELECT a.cand_firstname, a.cand_lastname, a.cand_middlename, a.cand_contactNo, a.cand_alternatecontactNo,a.cand_email, a.cand_email, a.cand_alternateEmail, a.cand_presentAddress, a.cand_permanentAddress, a.cand_dateofBirth, a.cand_sex, a.cand_sssNo, a.cand_tinNo, a.cand_philhealthNo, a.cand_pagibigNo, a.cand_password, a.cand_createdDatetime, a.cand_updatedDatetime,
  //     GROUP_CONCAT(b.educ_name SEPARATOR '|') as educ_name


  //   FROM tblcandidates a
  //   LEFT JOIN tbleducbackground b ON a.cand_id = b.educ_candId
  //   ";
  // }


  function getActiveJob($json) {
    include "connection.php";

    $data = json_decode($json, true);
    if (!isset($data['cand_id'])) {
      echo json_encode(["error" => "Missing candidate ID"]);
      return;
    }

    $sql = "

      SELECT a.jobM_id, a.jobM_title, a.jobM_description, a.jobM_status, a.jobM_passpercentage, o.passing_points,

             DATE_FORMAT(a.jobM_createdAt, '%b %d, %Y %h:%i %p') as jobM_createdAt,
             GROUP_CONCAT(DISTINCT c.duties_text SEPARATOR '|') as duties_text,

             GROUP_CONCAT(DISTINCT k.course_categoryName SEPARATOR '|') as course_categoryName,

             GROUP_CONCAT(DISTINCT e.jwork_responsibilities SEPARATOR '|') as jwork_responsibilities,

             GROUP_CONCAT(DISTINCT e.jwork_duration SEPARATOR '|') as jwork_duration,

             GROUP_CONCAT(DISTINCT f.jknow_text SEPARATOR '|') as jknow_text,

             GROUP_CONCAT(DISTINCT i.knowledge_name SEPARATOR '|') as knowledge_name,
             GROUP_CONCAT(DISTINCT g.jskills_text SEPARATOR '|') as jskills_text,
             GROUP_CONCAT(DISTINCT j.perT_name SEPARATOR '|') as perT_name,

             GROUP_CONCAT(DISTINCT CONCAT(n.license_type_name, ' in ', m.license_master_name) SEPARATOR '|') as license_master_name,

             (SELECT COUNT(DISTINCT b.app_candId)

              FROM tblapplications b

              WHERE b.app_jobMId = a.jobM_id) as Total_Applied,

             (SELECT COUNT(*)

              FROM tblapplications b

              WHERE b.app_jobMId = a.jobM_id AND b.app_candId = :cand_id) as Is_Applied

      FROM tbljobsmaster a

      LEFT JOIN tbljobsmasterduties c ON a.jobM_id = c.duties_jobId
      LEFT JOIN tbljobseducation d ON a.jobM_id = d.jeduc_jobId
      LEFT JOIN tbljobsworkexperience e ON a.jobM_id = e.jwork_jobId

      LEFT JOIN tbljobsknowledge f ON a.jobM_id = f.jknow_jobId

      LEFT JOIN tbljobsskills g ON a.jobM_id = g.jskills_jobId

      LEFT JOIN tbljobstrainings h ON a.jobM_id = h.jtrng_jobId

      LEFT JOIN tblpersonalknowledge i ON f.jknow_knowledgeId = i.knowledge_id

      LEFT JOIN tblpersonaltraining j ON h.jtrng_trainingId = j.perT_id

      LEFT JOIN tblcoursescategory k ON d.jeduc_categoryId = k.course_categoryId

      LEFT JOIN tbljobslicense l ON a.jobM_id = l.jlicense_jobId

      LEFT JOIN tbllicensemaster m ON l.jlicense_licenceMId = m.license_master_id

      LEFT JOIN tbllicensetype n ON m.license_master_typeId = n.license_type_id

      LEFT JOIN tbljobpassing o ON a.jobM_id = o.passing_jobId

      WHERE a.jobM_status = 1
      GROUP BY a.jobM_id, a.jobM_title, a.jobM_description, a.jobM_status, a.jobM_passpercentage, o.passing_points, a.jobM_createdAt
      ORDER BY a.jobM_createdAt DESC";

    try {

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":cand_id", $data['cand_id']);
        $stmt->execute();

        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (is_array($result)) {

            echo json_encode($result);
        } else {

            echo json_encode([]);
        }

    } catch (PDOException $e) {

        // Handle database errors

        echo json_encode(["error" => $e->getMessage()]);
    }
  }


  function getActiveJobs(){

    include "connection.php";


    $sql = "
      SELECT a.jobM_id, a.jobM_title, a.jobM_description, a.jobM_status, a.jobM_passpercentage, o.passing_points,
             DATE_FORMAT(a.jobM_createdAt, '%b %d, %Y %h:%i %p') as jobM_createdAt,
             GROUP_CONCAT(DISTINCT c.duties_text SEPARATOR '|') as duties_text,
             GROUP_CONCAT(DISTINCT k.course_categoryName SEPARATOR '|') as course_categoryName,
             GROUP_CONCAT(DISTINCT e.jwork_responsibilities SEPARATOR '|') as jwork_responsibilities,
             GROUP_CONCAT(DISTINCT e.jwork_duration SEPARATOR '|') as jwork_duration,
             GROUP_CONCAT(DISTINCT f.jknow_text SEPARATOR '|') as jknow_text,
             GROUP_CONCAT(DISTINCT i.knowledge_name SEPARATOR '|') as knowledge_name,
             GROUP_CONCAT(DISTINCT g.jskills_text SEPARATOR '|') as jskills_text,
             GROUP_CONCAT(DISTINCT j.perT_name SEPARATOR '|') as perT_name,
             GROUP_CONCAT(DISTINCT CONCAT(n.license_type_name, ' in ', m.license_master_name) SEPARATOR '|') as license_master_name,
             (SELECT COUNT(DISTINCT b.app_candId)

              FROM tblapplications b
              WHERE b.app_jobMId = a.jobM_id) as Total_Applied
      FROM tbljobsmaster a
      LEFT JOIN tbljobsmasterduties c ON a.jobM_id = c.duties_jobId
      LEFT JOIN tbljobseducation d ON a.jobM_id = d.jeduc_jobId
      LEFT JOIN tbljobsworkexperience e ON a.jobM_id = e.jwork_jobId
      LEFT JOIN tbljobsknowledge f ON a.jobM_id = f.jknow_jobId
      LEFT JOIN tbljobsskills g ON a.jobM_id = g.jskills_jobId
      LEFT JOIN tbljobstrainings h ON a.jobM_id = h.jtrng_jobId
      LEFT JOIN tblpersonalknowledge i ON f.jknow_knowledgeId = i.knowledge_id
      LEFT JOIN tblpersonaltraining j ON h.jtrng_trainingId = j.perT_id
      LEFT JOIN tblcoursescategory k ON d.jeduc_categoryId = k.course_categoryId
      LEFT JOIN tbljobslicense l ON a.jobM_id = l.jlicense_jobId
      LEFT JOIN tbllicensemaster m ON l.jlicense_licenceMId = m.license_master_id
      LEFT JOIN tbllicensetype n ON m.license_master_typeId = n.license_type_id
      LEFT JOIN tbljobpassing o ON a.jobM_id = o.passing_jobId
      WHERE a.jobM_status = 1
      GROUP BY a.jobM_id, a.jobM_title, a.jobM_description, a.jobM_status, a.jobM_passpercentage, o.passing_points, a.jobM_createdAt
      ORDER BY a.jobM_createdAt DESC";


    try {

        $stmt = $conn->prepare($sql);

        $stmt->execute();

        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (is_array($result)) {

            echo json_encode($result);
        } else {

            echo json_encode([]);
        }

    } catch (PDOException $e) {

        // Handle database errors

        echo json_encode(["error" => $e->getMessage()]);

    }
  }



function getAppliedJobs($json) {
    include "connection.php";

    try {
        $data = json_decode($json, true);
        if (!isset($data['cand_id'])) {
            echo json_encode(["error" => "Missing candidate ID"]);
            return;
        }

        $cand_id = (int) $data['cand_id'];

        $sql = "SELECT
                    a.jobM_title,
                    a.jobM_id,
                    d.status_name,
                    b.app_id,
                    b.app_datetime,
                    e.appS_id,
                    a.jobM_passpercentage,
                    o.passing_points,
                    DATE(e.appS_date) as appS_date
                FROM tbljobsmaster a
                INNER JOIN tblapplications b ON a.jobM_id = b.app_jobMId
                INNER JOIN (
                    SELECT appS_appId, MAX(appS_id) as max_appS_id
                    FROM tblapplicationstatus
                    GROUP BY appS_appId
                ) c ON b.app_id = c.appS_appId
                INNER JOIN tblapplicationstatus e ON c.max_appS_id = e.appS_id
                INNER JOIN tblstatus d ON e.appS_statusId = d.status_id
                INNER JOIN tbljobpassing o ON a.jobM_id = o.passing_jobId

                WHERE b.app_candId = :cand_id
                ORDER BY e.appS_date DESC";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
        $stmt->execute();

        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (empty($result)) {
            echo json_encode(["message" => "No applied jobs found"]);
            return;
        }

        echo json_encode($result);

    } catch (PDOException $e) {
        echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
}







function applyForJob()
{
    include "connection.php";

    $user_id = $_POST['user_id'];
    $jobId = $_POST['jobId'];

    $sqlCheckApplication = "
        SELECT e.appS_statusId
        FROM tblapplications a
        INNER JOIN tblapplicationstatus e ON a.app_id = e.appS_appId
        WHERE a.app_candId = :user_id AND a.app_jobMId = :jobId
        ORDER BY e.appS_id DESC LIMIT 1"; // Get the latest application status
    $stmtCheckApplication = $conn->prepare($sqlCheckApplication);
    $stmtCheckApplication->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmtCheckApplication->bindParam(':jobId', $jobId, PDO::PARAM_INT);
    $stmtCheckApplication->execute();

    $applicationStatus = $stmtCheckApplication->fetch(PDO::FETCH_ASSOC);

    if ($applicationStatus && $applicationStatus['appS_statusId'] != 12 && $applicationStatus['appS_statusId'] != 9 &&$applicationStatus['appS_statusId'] != 4) {
        echo json_encode(["status" => "duplicate", "message" => "You have already applied for this job"]);
        return;
    }

    $sqlGetStatusId = "SELECT status_id FROM tblstatus WHERE status_name = 'Pending'";
    $stmtGetStatusId = $conn->prepare($sqlGetStatusId);
    $stmtGetStatusId->execute();
    $status = $stmtGetStatusId->fetch(PDO::FETCH_ASSOC);
    $appSId = $status['status_id'];

    $conn->beginTransaction();

    try {
        date_default_timezone_set('Asia/Manila');
        $currentDateTime = date('Y-m-d H:i:s');

        $sqlApplication = "
            INSERT INTO tblapplications (app_candId, app_jobMId, app_datetime)
            VALUES (:user_id, :jobId, :app_datetime)
        ";
        $stmtApplication = $conn->prepare($sqlApplication);
        $stmtApplication->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmtApplication->bindParam(':jobId', $jobId, PDO::PARAM_INT);
        $stmtApplication->bindParam(':app_datetime', $currentDateTime, PDO::PARAM_STR);
        $stmtApplication->execute();

        $applicationId = $conn->lastInsertId();

        $sqlApplicationStatus = "
            INSERT INTO tblapplicationstatus (appS_appId, appS_statusId, appS_date)
            VALUES (:appS_appId, :appS_statusId, :appS_date)
        ";
        $stmtApplicationStatus = $conn->prepare($sqlApplicationStatus);
        $stmtApplicationStatus->bindParam(':appS_appId', $applicationId, PDO::PARAM_INT);
        $stmtApplicationStatus->bindParam(':appS_statusId', $appSId, PDO::PARAM_INT);
        $stmtApplicationStatus->bindParam(':appS_date', $currentDateTime, PDO::PARAM_STR);
        $stmtApplicationStatus->execute();

        $conn->commit();
        echo json_encode(["success" => "Job applied successfully"]);
    } catch (PDOException $e) {
        $conn->rollBack();
        echo json_encode(["error" => $e->getMessage()]);
    }
}

function cancelJobApplied($json)
{
    include "connection.php";

    // Decode the JSON received
    $data = json_decode($json, true);

    // Check if the necessary parameters are set
    if (!isset($data['user_id']) || !isset($data['jobId'])) {
        echo json_encode(["error" => "Missing required parameters"]);
        return;
    }

    $user_id = $data['user_id'];
    $jobId = $data['jobId'];
    $appId = $data['appId'];

    $sqlGetStatusId = "SELECT status_id FROM tblstatus WHERE status_name = 'Cancelled'";
    $stmtGetStatusId = $conn->prepare($sqlGetStatusId);
    $stmtGetStatusId->execute();
    $status = $stmtGetStatusId->fetch(PDO::FETCH_ASSOC);
    $cancelledStatusId = $status['status_id'];

    $conn->beginTransaction();

    try {
        date_default_timezone_set('Asia/Manila');
        $currentDateTime = date('Y-m-d H:i:s');

        $sqlInsertCancelledStatus = "
            INSERT INTO tblapplicationstatus (appS_appId, appS_statusId, appS_date)
            VALUES (:appS_appId, :appS_statusId, :appS_date)
        ";
        $stmtInsertCancelledStatus = $conn->prepare($sqlInsertCancelledStatus);
        $stmtInsertCancelledStatus->bindParam(':appS_appId', $appId, PDO::PARAM_INT);
        $stmtInsertCancelledStatus->bindParam(':appS_statusId', $cancelledStatusId, PDO::PARAM_INT);
        $stmtInsertCancelledStatus->bindParam(':appS_date', $currentDateTime, PDO::PARAM_STR);
        $stmtInsertCancelledStatus->execute();

        // // Delete the application from tblapplications
        // $sqlDeleteApplication = "DELETE FROM tblapplications WHERE app_id = :app_id";
        // $stmtDeleteApplication = $conn->prepare($sqlDeleteApplication);
        // $stmtDeleteApplication->bindParam(':app_id', $appId, PDO::PARAM_INT);
        // $stmtDeleteApplication->execute();

        $conn->commit();
        echo json_encode(["success" => "Job application cancelled successfully"]);
    } catch (PDOException $e) {
        $conn->rollBack();
        echo json_encode(["error" => $e->getMessage()]);
    }
}





function getCandidateProfile($json) {
    include "connection.php";
    $returnValue = [];
    $data = json_decode($json, true);

    $cand_id = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;


    $sql = "SELECT * FROM tblcandidates WHERE cand_id = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
    $stmt->execute();
    $returnValue["candidateInformation"] = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];


    $sql = "SELECT b.courses_name, c.institution_name, a.educ_dategraduate, d.course_categoryName, e.crs_type_name, a.educ_back_id, b.courses_id, c.institution_id, d.course_categoryId, e.crs_type_id FROM tblcandeducbackground a
     INNER JOIN tblcourses b ON a.educ_coursesId = b.courses_id
     INNER JOIN tblinstitution c ON a.educ_institutionId = c.institution_id
     INNER JOIN tblcoursescategory d ON b.courses_coursecategoryId = d.course_categoryId
     INNER JOIN tblcoursetype e ON b.courses_courseTypeId = e.crs_type_id
     WHERE educ_canId = :cand_id
     ORDER BY a.educ_back_id DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
    $stmt->execute();
    $returnValue["educationalBackground"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];


    $sql = "SELECT * FROM tblcandemploymenthistory
     WHERE empH_candId = :cand_id
     ORDER BY empH_id DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
    $stmt->execute();
    $returnValue["employmentHistory"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];


    $sql = "SELECT b.perS_name, b.perS_id, a.skills_id, a.skills_perSId
        FROM tblcandskills a
        INNER JOIN tblpersonalskills b ON a.skills_perSId = b.perS_id
        WHERE skills_candId = :cand_id
        ORDER BY a.skills_id DESC";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
    $stmt->execute();
    $returnValue["skills"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    $sql = "SELECT b.perT_name, a.training_id, b.perT_id, a.training_perTId, a.training_image FROM tblcandtraining a
     INNER JOIN tblpersonaltraining b ON a.training_perTId = b.perT_id
     WHERE training_candId = :cand_id
     ORDER BY a.training_id DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
    $stmt->execute();
    $returnValue["training"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    $sql = "SELECT b.knowledge_name, a.canknow_id, a.canknow_knowledgeId FROM tblcandknowledge a
     INNER JOIN tblpersonalknowledge b ON a.canknow_knowledgeId = b.knowledge_id
     WHERE canknow_canId = :cand_id
     ORDER BY a.canknow_id DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
    $stmt->execute();
    $returnValue["knowledge"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    $sql = "SELECT b.license_master_name, a.license_number, c.license_type_name, a.license_id, a.license_masterId FROM tblcandlicense a
    INNER JOIN tbllicensemaster b ON a.license_masterId = b.license_master_id
    INNER JOIN tbllicensetype c ON b.license_master_typeId = c.license_type_id
    WHERE license_canId = :cand_id
    ORDER BY a.license_id DESC";
   $stmt = $conn->prepare($sql);
   $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
   $stmt->execute();
   $returnValue["license"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

   $sql = "SELECT a.canres_image, a.canres_candId, a.canres_id
     FROM tblcandresume a
     WHERE canres_candId = :cand_id
     ORDER BY a.canres_candId DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
    $stmt->execute();
    $returnValue["resume"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    error_log("Return Value: " . print_r($returnValue, true));

    return json_encode($returnValue);
}


function getCandidateExpectedKeywords($json) {
  include "connection.php";
  $returnValue = [];
  $data = json_decode($json, true);


  $cand_id = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

  if ($cand_id === 0) {
      return json_encode(["error" => "Invalid candidate ID"]);
  }

  $sql = "SELECT cand_firstname, cand_lastname, cand_middlename FROM tblcandidates WHERE cand_id = :cand_id";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
  $stmt->execute();
  $candidateInfo = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];

  if ($candidateInfo) {
      $fullName = $candidateInfo['cand_firstname'] . ' ' . $candidateInfo['cand_middlename'] . ' ' . $candidateInfo['cand_lastname'];
      $returnValue["candidateInfo"] = ["fullName" => $fullName];
  }


  $sql = "SELECT b.courses_name, c.institution_name FROM tblcandeducbackground a
          INNER JOIN tblcourses b ON a.educ_coursesId = b.courses_id
          INNER JOIN tblinstitution c ON a.educ_institutionId = c.institution_id
          WHERE a.educ_canId = :cand_id";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
  $stmt->execute();
  $educationalBackground = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

  $returnValue["educationalBackground"] = [
      "courses" => array_column($educationalBackground, 'courses_name'),
      "institutions" => array_column($educationalBackground, 'institution_name')
  ];


  $sql = "SELECT empH_companyName, empH_positionName FROM tblcandemploymenthistory WHERE empH_candId = :cand_id";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
  $stmt->execute();
  $employmentHistory = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

  $returnValue["employmentHistory"] = [
      "companies" => array_column($employmentHistory, 'empH_companyName'),
      "positions" => array_column($employmentHistory, 'empH_positionName')
  ];


  $sql = "SELECT b.perS_name FROM tblcandskills a
          INNER JOIN tblpersonalskills b ON a.skills_perSId = b.perS_id
          WHERE a.skills_candId = :cand_id";
  $stmt = $conn->prepare($sql);
  $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
  $stmt->execute();
  $skills = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

  $returnValue["skills"] = array_column($skills, 'perS_name');

  return json_encode($returnValue);
}





function updateCandidatePersonalInfo($json) {
  include "connection.php";
  $data = json_decode($json, true);

  // Extract candidate ID from the data
  $cand_id = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

  if ($cand_id === 0) {
      return json_encode(["error" => "Invalid candidate ID"]);
  }

  try {
      // Update candidate information
      if (isset($data['candidateInformation'])) {
        $candidateInfo = $data['candidateInformation'];
        $sql = "UPDATE tblcandidates SET
                cand_firstname = :first_name,
                cand_lastname = :last_name,
                cand_email = :email,
                cand_contactNo = :contact_no,
                cand_alternatecontactNo = :alternate_contact_no,
                cand_presentAddress = :present_address,
                cand_permanentAddress = :permanent_address,
                cand_dateofBirth = :date_of_birth,
                cand_sex = :sex,
                cand_sssNo = :sss_no,
                cand_tinNo = :tin_no,
                cand_philhealthNo = :philhealth_no,
                cand_pagibigNo = :pagibig_no
                WHERE cand_id = :cand_id";

        $stmt = $conn->prepare($sql);

        $stmt->bindParam(':first_name', $candidateInfo['cand_firstname'], PDO::PARAM_STR);
        $stmt->bindParam(':last_name', $candidateInfo['cand_lastname'], PDO::PARAM_STR);
        $stmt->bindParam(':email', $candidateInfo['cand_email'], PDO::PARAM_STR);
        $stmt->bindParam(':contact_no', $candidateInfo['cand_contactNo'], PDO::PARAM_STR);
        $stmt->bindParam(':alternate_contact_no', $candidateInfo['cand_alternatecontactNo'], PDO::PARAM_STR);
        $stmt->bindParam(':present_address', $candidateInfo['cand_presentAddress'], PDO::PARAM_STR);
        $stmt->bindParam(':permanent_address', $candidateInfo['cand_permanentAddress'], PDO::PARAM_STR);
        $stmt->bindParam(':date_of_birth', $candidateInfo['cand_dateofBirth'], PDO::PARAM_STR);
        $stmt->bindParam(':sex', $candidateInfo['cand_sex'], PDO::PARAM_STR);
        $stmt->bindParam(':sss_no', $candidateInfo['cand_sssNo'], PDO::PARAM_STR);
        $stmt->bindParam(':tin_no', $candidateInfo['cand_tinNo'], PDO::PARAM_STR);
        $stmt->bindParam(':philhealth_no', $candidateInfo['cand_philhealthNo'], PDO::PARAM_STR);
        $stmt->bindParam(':pagibig_no', $candidateInfo['cand_pagibigNo'], PDO::PARAM_STR);
        $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);

        $stmt->execute();
    }


      return json_encode(["success" => "Profile updated successfully"]);

  } catch (PDOException $e) {
      return json_encode(["error" => $e->getMessage()]);
  }
}

// function updateEducationalBackground($json)
// {
//     include "connection.php";
//     $conn->beginTransaction();
//     try {
//         $json = json_decode($json, true);
//         $candidateId = $json['candidateId'] ?? 0;
//         $educationalBackground = $json['educationalBackground'] ?? [];

//         if (!empty($educationalBackground)) {
//             foreach ($educationalBackground as $item) {
//                 if (isset($item['educId']) && !empty($item['educId'])) {

//                     if (isset($item['deleteFlag']) && $item['deleteFlag'] === true) {

//                         $sql = "DELETE FROM tblcandeducbackground WHERE educ_canId = :candidateId AND educ_back_id = :educ_back_id";
//                         $stmt = $conn->prepare($sql);
//                         $stmt->bindParam(':candidateId', $candidateId);
//                         $stmt->bindParam(':educ_back_id', $item['educId']);
//                         $stmt->execute();
//                     } else {

//                         $sql = "UPDATE tblcandeducbackground
//                                 SET educ_coursesId = :educational_courses_id,
//                                     educ_institutionId = :educational_institution_id,
//                                     educ_dateGraduate = :educational_date_graduate
//                                 WHERE educ_back_id = :educ_back_id";
//                         $stmt = $conn->prepare($sql);
//                         $stmt->bindParam(':educational_courses_id', $item['courseId']);
//                         $stmt->bindParam(':educational_institution_id', $item['institutionId']);
//                         $stmt->bindParam(':educational_date_graduate', $item['courseDateGraduated']);
//                         $stmt->bindParam(':educ_back_id', $item['educId']);
//                         $stmt->execute();
//                     }
//                 } else {

//                     $sql = "INSERT INTO tblcandeducbackground (educ_canId, educ_coursesId, educ_institutionId, educ_dateGraduate)
//                             VALUES (:personal_info_id, :educational_courses_id, :educational_institution_id, :educational_date_graduate)";
//                     $stmt = $conn->prepare($sql);
//                     $stmt->bindParam(':personal_info_id', $candidateId);
//                     $stmt->bindParam(':educational_courses_id', $item['courseId']);
//                     $stmt->bindParam(':educational_institution_id', $item['institutionId']);
//                     $stmt->bindParam(':educational_date_graduate', $item['courseDateGraduated']);
//                     $stmt->execute();
//                 }
//             }
//         }

//         $conn->commit();
//         return 1; // Success

//     } catch (PDOException $th) {
//         $conn->rollBack();
//         return 0; // Failure
//     }
// }

function updateEducationalBackground($json)
{
    include "connection.php";
    $conn->beginTransaction();
    try {
        $json = json_decode($json, true);
        $candidateId = $json['candidateId'] ?? 0;
        $educationalBackground = $json['educationalBackground'] ?? [];

        if (!empty($educationalBackground)) {
            foreach ($educationalBackground as $item) {

                $courseId = $item['courseId'] ?? null;
                $institutionId = $item['institutionId'] ?? null;
                $courseCategoryId = $item['courseCategoryId'] ?? null;
                $courseTypeId = $item['courseTypeId'] ?? null;





                if ($courseCategoryId === "custom" && !empty($item['customCourseCategory'])) {
                    $sql = "INSERT INTO tblcoursescategory (course_categoryName) VALUES (:course_categoryName)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bindParam(':course_categoryName', $item['customCourseCategory']);
                    $stmt->execute();
                    $courseCategoryId = $conn->lastInsertId();
                }


                if ($courseTypeId === "custom" && !empty($item['customCourseType'])) {
                    $sql = "INSERT INTO tblcoursetype (crs_type_name) VALUES (:crs_type_name)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bindParam(':crs_type_name', $item['customCourseType']);
                    $stmt->execute();
                    $courseTypeId = $conn->lastInsertId();
                }

                if ($courseId === "custom" && !empty($item['customCourse'])) {
                  $sql = "INSERT INTO tblcourses (courses_name, courses_coursecategoryId, courses_courseTypeId) VALUES (:course_name, :course_category_id, :course_type_id)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':course_name', $item['customCourse']);
                  $stmt->bindParam(':course_category_id', $courseCategoryId);
                  $stmt->bindParam(':course_type_id', $courseTypeId);
                  $stmt->execute();
                  $courseId = $conn->lastInsertId();
              }

                // Check if custom institution
                if ($institutionId === "custom" && !empty($item['customInstitution'])) {
                    $sql = "INSERT INTO tblinstitution (institution_name) VALUES (:institution_name)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bindParam(':institution_name', $item['customInstitution']);
                    $stmt->execute();
                    $institutionId = $conn->lastInsertId(); // Get last inserted ID
                }

                // Check if educId exists for update or delete
                if (isset($item['educId']) && !empty($item['educId'])) {
                    if (isset($item['deleteFlag']) && $item['deleteFlag'] === true) {
                        $sql = "DELETE FROM tblcandeducbackground WHERE educ_canId = :candidateId AND educ_back_id = :educ_back_id";
                        $stmt = $conn->prepare($sql);
                        $stmt->bindParam(':candidateId', $candidateId);
                        $stmt->bindParam(':educ_back_id', $item['educId']);
                        $stmt->execute();
                    } else {
                        $sql = "UPDATE tblcandeducbackground
                                SET educ_coursesId = :educational_courses_id,
                                    educ_institutionId = :educational_institution_id,
                                    educ_dateGraduate = :educational_date_graduate
                                WHERE educ_back_id = :educ_back_id";
                        $stmt = $conn->prepare($sql);
                        $stmt->bindParam(':educational_courses_id', $courseId);
                        $stmt->bindParam(':educational_institution_id', $institutionId);
                        $stmt->bindParam(':educational_date_graduate', $item['courseDateGraduated']);
                        $stmt->bindParam(':educ_back_id', $item['educId']);
                        $stmt->execute();
                    }
                } else {
                    // If educId is not set, insert a new record
                    $sql = "INSERT INTO tblcandeducbackground (educ_canId, educ_coursesId, educ_institutionId, educ_dateGraduate)
                            VALUES (:personal_info_id, :educational_courses_id, :educational_institution_id, :educational_date_graduate)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bindParam(':personal_info_id', $candidateId);
                    $stmt->bindParam(':educational_courses_id', $courseId);
                    $stmt->bindParam(':educational_institution_id', $institutionId);
                    $stmt->bindParam(':educational_date_graduate', $item['courseDateGraduated']);
                    $stmt->execute();
                }
            }
        }

        $conn->commit();
        return 1; // Success

    } catch (PDOException $th) {
        $conn->rollBack();
        return 0; // Failure
    }
}


function deleteEducationalBackground($json)
{
    include "connection.php";

    $conn->beginTransaction();
    try {
        $json = json_decode($json, true);
        $candidateId = $json['candidateId'] ?? 0;
        $educationalBackground = $json['educationalBackground'] ?? [];

        if (!empty($educationalBackground)) {
            foreach ($educationalBackground as $item) {
                if (isset($item['educId']) && !empty($item['educId'])) {
                    // Check if deleteFlag is set to true
                    if (isset($item['deleteFlag']) && $item['deleteFlag'] === true) {
                        // Delete the education record
                        $sql = "DELETE FROM tblcandeducbackground WHERE educ_canId = :candidateId AND educ_back_id = :educ_back_id";
                        $stmt = $conn->prepare($sql);
                        $stmt->bindParam(':candidateId', $candidateId);
                        $stmt->bindParam(':educ_back_id', $item['educId']);
                        $stmt->execute();

                        // Check if the deletion was successful
                        if ($stmt->rowCount() === 0) {
                            throw new Exception("Failed to delete record with ID: " . $item['educId']);
                        }
                    }
                }
            }
        }

        $conn->commit();
        return 1; // Success

    } catch (Exception $e) {
        $conn->rollBack();
        return 0; // Failure
    }
}





// function updateEducationalBackground($json)
// {
//     include "connection.php";
//     $conn->beginTransaction();
//     try {
//         $json = json_decode($json, true);
//         $candidateId = $json['candidateId'] ?? 0;
//         $educationalBackground = $json['educationalBackground'] ?? [];

//         foreach ($educationalBackground as $item) {
//             $courseId = $item['courseId'] ?? null;
//             $institutionId = $item['institutionId'] ?? null;
//             $customCourse = $item['customCourse'] ?? null;
//             $customInstitution = $item['customInstitution'] ?? null;

//             // Insert custom course if necessary
//             if ($courseId === 'other' && $customCourse) {
//                 $sql = "INSERT INTO tblcourses (courses_name) VALUES (:course_name)";
//                 $stmt = $conn->prepare($sql);
//                 $stmt->bindParam(':course_name', $customCourse);
//                 $stmt->execute();
//                 $courseId = $conn->lastInsertId();
//             }

//             // Insert custom institution if necessary
//             if ($institutionId === 'other' && $customInstitution) {
//                 $sql = "INSERT INTO tblinstitutions (institution_name) VALUES (:institution_name)";
//                 $stmt = $conn->prepare($sql);
//                 $stmt->bindParam(':institution_name', $customInstitution);
//                 $stmt->execute();
//                 $institutionId = $conn->lastInsertId();
//             }

//             if (isset($item['educId']) && !empty($item['educId'])) {
//                 // Update existing record
//                 $sql = "UPDATE tblcandeducbackground
//                         SET educ_coursesId = :educational_courses_id,
//                             educ_institutionId = :educational_institution_id,
//                             educ_dateGraduate = :educational_date_graduate
//                         WHERE educ_back_id = :educ_back_id";
//                 $stmt = $conn->prepare($sql);
//                 $stmt->bindParam(':educational_courses_id', $courseId);
//                 $stmt->bindParam(':educational_institution_id', $institutionId);
//                 $stmt->bindParam(':educational_date_graduate', $item['courseDateGraduated']);
//                 $stmt->bindParam(':educ_back_id', $item['educId']);
//                 $stmt->execute();
//             } else {
//                 // Insert new record
//                 $sql = "INSERT INTO tblcandeducbackground (educ_canId, educ_coursesId, educ_institutionId, educ_dateGraduate)
//                         VALUES (:personal_info_id, :educational_courses_id, :educational_institution_id, :educational_date_graduate)";
//                 $stmt = $conn->prepare($sql);
//                 $stmt->bindParam(':personal_info_id', $candidateId);
//                 $stmt->bindParam(':educational_courses_id', $courseId);
//                 $stmt->bindParam(':educational_institution_id', $institutionId);
//                 $stmt->bindParam(':educational_date_graduate', $item['courseDateGraduated']);
//                 $stmt->execute();
//             }
//         }

//         $conn->commit();
//         return 1;

//     } catch (PDOException $th) {
//         $conn->rollBack();
//         return 0;
//     }
// }


function updateCandidateEmploymentInfo($json)
{
    include "connection.php";
    $data = json_decode($json, true);
    $cand_id = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

    $conn->beginTransaction();
    try {
        if (isset($data['employmentHistory'])) {
            foreach ($data['employmentHistory'] as $item) {
                $empH_id = isset($item['empH_id']) ? (int) $item['empH_id'] : 0;

                if (isset($item['deleteFlag']) && $item['deleteFlag'] === true) {
                    // Delete the employment record
                    if ($empH_id > 0) {
                        $sql = "DELETE FROM tblcandemploymenthistory WHERE empH_id = :empH_id AND empH_candId = :cand_id";
                        $stmt = $conn->prepare($sql);
                        $stmt->bindParam(':empH_id', $empH_id, PDO::PARAM_INT);
                        $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
                        $stmt->execute();
                    }
                } else {
                    // Update or insert the employment record
                    if ($empH_id > 0) {
                        // Update existing record
                        $sql = "UPDATE tblcandemploymenthistory
                                SET empH_positionName = :position_name,
                                    empH_companyName = :company_name,
                                    empH_startdate = :start_date,
                                    empH_enddate = :end_date
                                WHERE empH_id = :empH_id AND empH_candId = :cand_id";
                        $stmt = $conn->prepare($sql);
                        $stmt->bindParam(':empH_id', $empH_id, PDO::PARAM_INT);
                    } else {
                        // Insert new record
                        $sql = "INSERT INTO tblcandemploymenthistory (empH_candId, empH_positionName, empH_companyName, empH_startdate, empH_enddate)
                                VALUES (:cand_id, :position_name, :company_name, :start_date, :end_date)";
                        $stmt = $conn->prepare($sql);
                    }

                    $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);
                    $stmt->bindParam(':position_name', $item['empH_positionName'], PDO::PARAM_STR);
                    $stmt->bindParam(':company_name', $item['empH_companyName'], PDO::PARAM_STR);
                    $stmt->bindParam(':start_date', $item['empH_startdate'], PDO::PARAM_STR);
                    $stmt->bindParam(':end_date', $item['empH_enddate'], PDO::PARAM_STR);
                    $stmt->execute();
                }
            }
        }

        $conn->commit();
        return json_encode(["success" => "Employment info updated successfully"]);
    } catch (PDOException $e) {
        $conn->rollBack();
        return json_encode(["error" => $e->getMessage()]);
    }
}



function updateCandidateSkills($json) {
  include "connection.php";
  $conn->beginTransaction();
  try {
      $json = json_decode($json, true);
      $candidateId = $json['candidateId'] ?? 0;
      $skills = $json['skills'] ?? [];

      if (!empty($skills)) {
          foreach ($skills as $item) {
              $skillId = $item['skillId'] ?? null;
              $skills_id = $item['skills_id'] ?? null;
              $deleteFlag = $item['deleteFlag'] ?? false;

              // Handle custom skills
              if ($skillId === "custom" && !empty($item['customSkill'])) {
                  // Insert custom skill into tblpersonalskills
                  $sql = "INSERT INTO tblpersonalskills (perS_name) VALUES (:perS_name)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':perS_name', $item['customSkill']);
                  $stmt->execute();
                  $skillId = $conn->lastInsertId();
              }

              if ($deleteFlag) {
                  // Delete the skill record from tblcandskills
                  $sql = "DELETE FROM tblcandskills WHERE skills_id = :skills_id AND skills_candId = :skills_candId";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':skills_id', $skills_id);
                  $stmt->bindParam(':skills_candId', $candidateId);
                  $stmt->execute();
              } else {
                  // Check if skills_id exists for update
                  if (!empty($skills_id)) {
                      // Update existing skill in tblcandskills
                      $sql = "UPDATE tblcandskills
                              SET skills_perSId = :skills_perSId
                              WHERE skills_id = :skills_id AND skills_candId = :skills_candId";
                      $stmt = $conn->prepare($sql);
                      $stmt->bindParam(':skills_perSId', $skillId); // Use skills_id from tblpersonalskills
                      $stmt->bindParam(':skills_id', $skills_id);
                      $stmt->bindParam(':skills_candId', $candidateId);
                      $stmt->execute();
                  } else {
                      // Insert a new skill if it does not exist
                      $sql = "INSERT INTO tblcandskills (skills_candId, skills_perSId)
                              VALUES (:skills_candId, :skills_perSId)";
                      $stmt = $conn->prepare($sql);
                      $stmt->bindParam(':skills_candId', $candidateId);
                      $stmt->bindParam(':skills_perSId', $skillId); // Here, we pass the skills_id from tblpersonalskills
                      $stmt->execute();
                  }
              }
          }
      }

      $conn->commit();
      return 1; // Success

  } catch (PDOException $e) {
      $conn->rollBack();
      error_log("Error updating, inserting, or deleting skills: " . $e->getMessage());
      return 0; // Failure
  }
}






function updateCandidateTraining($json) {
  include "connection.php";
  $conn->beginTransaction();
  try {
      $json = json_decode($json, true);
      $candidateId = $json['cand_id'] ?? 0;
      $trainings = $json['training'] ?? [];

      if (!empty($trainings)) {
          foreach ($trainings as $item) {
              $trainingId = $item['training_id'] ?? null;
              $perTId = $item['perT_id'] ?? null;
              $imageFileName = $_FILES['image']['name'] ?? null;
              $deleteFlag = $item['deleteFlag'] ?? false;


              if ($perTId === "custom" && !empty($item['customTraining'])) {
                $sql = "INSERT INTO tblpersonaltraining (perT_name) VALUES (:perT_name)";
                $stmt = $conn->prepare($sql);
                $stmt->bindParam(':perT_name', $item['customTraining']);
                $stmt->execute();
                $perTId = $conn->lastInsertId();
              }


              if ($deleteFlag && $trainingId) {
                $sql = "DELETE FROM tblcandtraining WHERE training_id = :training_id AND training_candId = :training_candId";
                $stmt = $conn->prepare($sql);
                $stmt->bindParam(':training_id', $trainingId);
                $stmt->bindParam(':training_candId', $candidateId);
                $stmt->execute();
              } elseif ($trainingId === null) {
                  $sql = "INSERT INTO tblcandtraining (training_candId, training_perTId, training_image) VALUES (:training_candId, :training_perTId, :training_image)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':training_candId', $candidateId);
                  $stmt->bindParam(':training_perTId', $perTId);
                  $stmt->bindParam(':training_image', $imageFileName);
                  $stmt->execute();
              } else {
                  $sql = "UPDATE tblcandtraining SET training_perTId = :training_perTId, training_image = :training_image WHERE training_id = :training_id";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':training_perTId', $perTId);
                  $stmt->bindParam(':training_image', $imageFileName);
                  $stmt->bindParam(':training_id', $trainingId);
                  $stmt->execute();
              }

              if ($imageFileName) {
                  $targetDir = "uploads/";
                  $targetFile = $targetDir . basename($imageFileName);
                  move_uploaded_file($_FILES['image']['tmp_name'], $targetFile);

                  $flutterAssetsDir = "C:/Users/ACER/delmonteflutter/assets/images/";
                  if (!file_exists($flutterAssetsDir)) {
                      mkdir($flutterAssetsDir, 0777, true);
                  }
                  $flutterTargetFile = $flutterAssetsDir . basename($imageFileName);
                  copy($targetFile, $flutterTargetFile);
              }
          }
      }

      $conn->commit();
      return 1;
  } catch (PDOException $e) {
      $conn->rollBack();
      error_log("Error updating training: " . $e->getMessage());
      return 0;
  }
}







function updateCandidateKnowledge($json) {
  include "connection.php";
  $conn->beginTransaction();
  try {
      // Decode JSON
      $json = json_decode($json, true);
      $candidateId = $json['cand_id'] ?? 0;
      $knowledge = $json['knowledge'] ?? [];

      if (!empty($knowledge)) {
          foreach ($knowledge as $item) {
              $canknow_id = $item['canknow_id'] ?? null;
              $knowledge_id = $item['knowledge_id'] ?? null;
              $deleteFlag = $item['deleteFlag'] ?? false;


              if ($knowledge_id === "custom" && !empty($item['customKnowledge'])) {
                $sql = "INSERT INTO tblpersonalknowledge (knowledge_name) VALUES (:knowledge_name)";
                $stmt = $conn->prepare($sql);
                $stmt->bindParam(':knowledge_name', $item['customKnowledge']);
                $stmt->execute();
                $knowledge_id = $conn->lastInsertId();
              }


              if ($deleteFlag && $canknow_id) {

                $sql = "DELETE FROM tblcandknowledge WHERE canknow_id = :canknow_id AND canknow_canId = :canknow_canId";
                $stmt = $conn->prepare($sql);
                $stmt->bindParam(':canknow_id', $canknow_id);
                $stmt->bindParam(':canknow_canId', $candidateId);
                $stmt->execute();
            }

              elseif ($canknow_id === null) {

                  $sql = "INSERT INTO tblcandknowledge (canknow_canId, canknow_knowledgeId)
                          VALUES (:canknow_canId, :knowledge_id)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':canknow_canId', $candidateId);
                  $stmt->bindParam(':knowledge_id', $knowledge_id);
                  $stmt->execute();
                  error_log("Knowledge inserted: candId = $candidateId, knowledge_id = $knowledge_id");
              } else {

                  $sql = "UPDATE tblcandknowledge
                          SET canknow_knowledgeId = :knowledge_id
                          WHERE canknow_id = :canknow_id";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':knowledge_id', $knowledge_id);
                  $stmt->bindParam(':canknow_id', $canknow_id);
                  $stmt->execute();
                  error_log("Knowledge updated: canknow_id = $canknow_id, knowledge_id = $knowledge_id");
              }
          }
      }

      $conn->commit();
      return 1; // Return success
  } catch (PDOException $e) {
      $conn->rollBack();
      error_log("Error updating knowledge: " . $e->getMessage()); // Log the error for debugging
      return 0; // Return failure
  }
}




function updateCandidateLicense($json)
{
    include "connection.php";
    $conn->beginTransaction();
    try {
        $json = json_decode($json, true);
        $candidateId = $json['cand_id'] ?? 0;
        $license = $json['license'] ?? [];

        if (!empty($license)) {
            foreach ($license as $item) {
                $deleteFlag = $item['deleteFlag'] ?? false;
                $license_id = $item['license_id'] ?? null;
                $license_type_id = $item['license_type_id'] ?? null;
                $license_masterId = $item['license_masterId'] ?? null;


                if ($license_type_id === "custom" && !empty($item['customLicenseType'])) {
                  $sql = "INSERT INTO tbllicensetype (license_type_name) VALUES (:license_type_name)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':license_type_name', $item['customLicenseType']);
                  $stmt->execute();
                  $license_type_id = $conn->lastInsertId();
                }

                if ($license_masterId === "custom" && !empty($item['customLicenseMaster'])) {
                  $sql = "INSERT INTO tbllicensemaster (license_master_name, license_master_typeId) VALUES (:license_master_name, :license_master_typeId)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':license_master_name', $item['customLicenseMaster']);
                  $stmt->bindParam(':license_master_typeId', $license_type_id);
                  $stmt->execute();
                  $license_masterId = $conn->lastInsertId();
                }

                // Handle delete operation
                if ($deleteFlag && $license_id) {
                    // Delete license record
                    $sql = "DELETE FROM tblcandlicense WHERE license_id = :license_id AND license_canId = :license_canId";
                    $stmt = $conn->prepare($sql);
                    $stmt->bindParam(':license_id', $license_id, PDO::PARAM_INT);
                    $stmt->bindParam(':license_canId', $candidateId, PDO::PARAM_INT);
                    $stmt->execute();
                } elseif (isset($item['license_id']) && !empty($item['license_id'])) {
                    // Update existing license
                    $sql = "UPDATE tblcandlicense
                            SET license_masterId = :license_masterId,
                                license_number = :license_number
                            WHERE license_id = :license_id";
                    $stmt = $conn->prepare($sql);
                    $stmt->bindParam(':license_masterId', $license_masterId, PDO::PARAM_INT);
                    $stmt->bindParam(':license_number', $item['license_number'], PDO::PARAM_STR);
                    $stmt->bindParam(':license_id', $item['license_id'], PDO::PARAM_INT);
                    $stmt->execute();
                } else {
                    // Insert new license
                    $sql = "INSERT INTO tblcandlicense (license_canId, license_masterId, license_number)
                            VALUES (:license_canId, :license_masterId, :license_number)";
                    $stmt = $conn->prepare($sql);
                    $stmt->bindParam(':license_canId', $candidateId, PDO::PARAM_INT);
                    $stmt->bindParam(':license_masterId', $license_masterId, PDO::PARAM_INT);
                    $stmt->bindParam(':license_number', $item['license_number'], PDO::PARAM_STR);
                    $stmt->execute();
                }
            }
        }

        $conn->commit();
        return 1;
    } catch (PDOException $th) {
        $conn->rollBack();
        return 0;
    }
}

function updateCandidateResume($json) {
  include "connection.php";
  $conn->beginTransaction();
  try {
      $json = json_decode($json, true);
      $candidateId = $json['cand_id'] ?? 0;
      $resumes = $json['resume'] ?? [];

      if (!empty($resumes)) {
          foreach ($resumes as $item) {
              $canresId = $item['canres_id'] ?? null;
              $imageFileName = $_FILES['image']['name'] ?? null;
              $deleteFlag = $item['deleteFlag'] ?? false;

              if ($deleteFlag && $canresId) {

                $sql = "DELETE FROM tblcandresume WHERE canres_id  = :canres_id  AND canres_candId = :canres_candId";
                $stmt = $conn->prepare($sql);
                $stmt->bindParam(':canres_id', $canresId);
                $stmt->bindParam(':canres_candId', $candidateId);
                $stmt->execute();
            }

              elseif ($canresId === null) {

                  $sql = "INSERT INTO tblcandresume (canres_candId,  canres_image) VALUES (:canres_candId, :canres_image)";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':canres_candId', $candidateId);
                  $stmt->bindParam(':canres_image', $imageFileName);
                  $stmt->execute();
              } else {

                  $sql = "UPDATE tblcandresume SET canres_image = :canres_image WHERE canres_id = :canres_id";
                  $stmt = $conn->prepare($sql);
                  $stmt->bindParam(':canres_image', $imageFileName);
                  $stmt->bindParam(':canres_id', $canresId);
                  $stmt->execute();
              }


              if ($imageFileName) {
                  $targetDir = "uploads/";
                  $targetFile = $targetDir . basename($imageFileName);
                  move_uploaded_file($_FILES['image']['tmp_name'], $targetFile);
              }
          }
      }

      $conn->commit();
      return 1;
  } catch (PDOException $e) {
      $conn->rollBack();
      error_log("Error updating training: " . $e->getMessage());
      return 0;
  }
}


function updateEmailPassword($json)
{
    include "connection.php";
    $data = json_decode($json, true);

    $cand_id = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

    if ($cand_id === 0) {
        return json_encode(["error" => "Invalid candidate ID"]);
    }

    try {

        if (isset($data['email']) && isset($data['password'])) {
            $email = $data['email'];
            $password = $data['password'];

            $sql = "UPDATE tblcandidates SET
                    cand_email = :email,
                    cand_password = :password
                    WHERE cand_id = :cand_id";

            $stmt = $conn->prepare($sql);

            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->bindParam(':password', $password, PDO::PARAM_STR);
            $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);

            $stmt->execute();
        }

        return json_encode(["success" => "Email and password updated successfully"]);
    } catch (PDOException $e) {
        return json_encode(["error" => $e->getMessage()]);
    }
}

function updatePassword($json)
{
    include "connection.php";
    $data = json_decode($json, true);

    $cand_id = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

    if ($cand_id === 0) {
        return json_encode(["error" => "Invalid candidate ID"]);
    }

    try {
        if (isset($data['password'])) {
            $password = $data['password'];

            // Update only the password
            $sql = "UPDATE tblcandidates SET
                    cand_password = :password
                    WHERE cand_id = :cand_id";

            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':password', $password, PDO::PARAM_STR);
            $stmt->bindParam(':cand_id', $cand_id, PDO::PARAM_INT);

            $stmt->execute();
        }

        return json_encode(["success" => "Password updated successfully"]);
    } catch (PDOException $e) {
        return json_encode(["error" => $e->getMessage()]);
    }
}


function getJobExam($json) {
  include "connection.php";
  $returnValue = [];
  $data = json_decode($json, true);

  $jobM_id = isset($data['jobM_id']) ? (int) $data['jobM_id'] : null;

  // Modify the SQL query to prioritize exams with a non-null jobM_id
  if ($jobM_id) {
      $sql = "SELECT a.examQ_id, a.examQ_text, a.examQ_typeId, a.examQ_points, b.examC_id, b.examC_text, b.examC_isCorrect, c.exam_id, c.exam_duration, c.exam_jobMId
              FROM tblexamquestion a
              LEFT JOIN tblexamchoices b ON a.examQ_id = b.examC_questionId
              LEFT JOIN tblexam c ON a.examQ_examId = c.exam_id
              WHERE c.exam_jobMId = :jobM_id
              UNION
              SELECT a.examQ_id, a.examQ_text, a.examQ_typeId, a.examQ_points, b.examC_id, b.examC_text, b.examC_isCorrect, c.exam_id, c.exam_duration, c.exam_jobMId
              FROM tblexamquestion a
              LEFT JOIN tblexamchoices b ON a.examQ_id = b.examC_questionId
              LEFT JOIN tblexam c ON a.examQ_examId = c.exam_id
              WHERE c.exam_jobMId IS NULL";
  } else {
      $sql = "SELECT a.examQ_id, a.examQ_text, a.examQ_typeId, b.examC_id, b.examC_text, b.examC_isCorrect, c.exam_id, c.exam_duration, c.exam_jobMId
              FROM tblexamquestion a
              LEFT JOIN tblexamchoices b ON a.examQ_id = b.examC_questionId
              LEFT JOIN tblexam c ON a.examQ_examId = c.exam_id
              WHERE c.exam_jobMId IS NULL";
  }

  $stmt = $conn->prepare($sql);

  if ($jobM_id) {
      $stmt->bindParam(':jobM_id', $jobM_id, PDO::PARAM_INT);
  }

  $stmt->execute();

  $questions = [];
  while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
      $examQ_id = $row['examQ_id'];
      $exam_id = $row['exam_id'];
      if (!isset($questions[$examQ_id])) {
          $questions[$examQ_id] = [
              'examQ_id' => $row['examQ_id'],
              'examQ_text' => $row['examQ_text'],
              'exam_id' => $row['exam_id'],
              'exam_duration' => $row['exam_duration'],
              'exam_jobMId' => $row['exam_jobMId'],
              'examQ_points' => $row['examQ_points'],
              'examQ_typeId' => $row['examQ_typeId'],
              'choices' => []
          ];
      }

      // Check if choices exist
      if ($row['examC_id'] !== null) {
          $questions[$examQ_id]['choices'][] = [
              'examC_id' => $row['examC_id'],
              'examC_text' => $row['examC_text'],
              'examC_isCorrect' => $row['examC_isCorrect']
          ];
      }
  }

  $returnValue["examQuestions"] = array_values($questions);

  return json_encode($returnValue);
}

function insertExamResult($json) {
  include "connection.php";
  $data = json_decode($json, true);

  $candId = isset($data['examR_candId']) ? (int) $data['examR_candId'] : 0;
  $examId = isset($data['examR_examId']) ? (int) $data['examR_examId'] : 0;
  $score = isset($data['examR_score']) ? (int) $data['examR_score'] : 0;
  $status = isset($data['examR_status']) ? (int) $data['examR_status'] : 0;
  $totalScore = isset($data['examR_totalscore']) ? (int) $data['examR_totalscore'] : 0;
  $appId = isset($data['app_id']) ? (int) $data['app_id'] : 0;
  $jobMId = isset($data['examR_jobMId']) ? (int) $data['examR_jobMId'] : 0;

  if ($candId && $examId) {
      try {
          $conn->beginTransaction();

          $sql = "INSERT INTO tblexamresult (examR_candId, examR_examId, examR_jobMId, examR_score, examR_totalscore, examR_status, examR_date)
                  VALUES (:candId, :examId, :jobMId, :score, :totalScore, :status, NOW())";
          $stmt = $conn->prepare($sql);
          $stmt->bindParam(':candId', $candId, PDO::PARAM_INT);
          $stmt->bindParam(':examId', $examId, PDO::PARAM_INT);
          $stmt->bindParam(':jobMId', $jobMId, PDO::PARAM_INT);
          $stmt->bindParam(':score', $score, PDO::PARAM_INT);
          $stmt->bindParam(':status', $status, PDO::PARAM_INT);
          $stmt->bindParam(':totalScore', $totalScore, PDO::PARAM_INT);
          $stmt->execute();

          $examR_id = $conn->lastInsertId();

          $appStatusId = ($status === 1) ? 7 : 9;

          // Insert additional status if status is 1
          if ($status === 1) {
              $sqlStatus = "INSERT INTO tblapplicationstatus (appS_appId, appS_statusId, appS_date)
                            VALUES (:appS_appId, 10, NOW())";
              $stmtStatus = $conn->prepare($sqlStatus);
              $stmtStatus->bindParam(':appS_appId', $appId, PDO::PARAM_INT);
              $stmtStatus->execute();
          }

          $sqlStatus = "INSERT INTO tblapplicationstatus (appS_appId, appS_statusId, appS_date)
                        VALUES (:appS_appId, :appS_statusId, NOW())";
          $stmtStatus = $conn->prepare($sqlStatus);
          $stmtStatus->bindParam(':appS_appId', $appId, PDO::PARAM_INT);
          $stmtStatus->bindParam(':appS_statusId', $appStatusId, PDO::PARAM_INT);
          $stmtStatus->execute();

          $conn->commit();

          return json_encode(["success" => true, "examR_id" => $examR_id]);
      } catch (PDOException $e) {
          $conn->rollBack();
          return json_encode(["success" => false, "message" => "Error inserting exam result: " . $e->getMessage()]);
      }
  } else {
      return json_encode(["success" => false, "message" => "Invalid candidate or exam ID."]);
  }
}

function insertCandidateAnswers($json) {
  include "connection.php";
  $data = json_decode($json, true);

  // Extract data from JSON
  $result_id = isset($data['examR_id']) ? (int) $data['examR_id'] : 0;
  $answers = isset($data['answers']) ? $data['answers'] : [];

  if ($result_id && !empty($answers)) {
    try {
      $conn->beginTransaction();

      foreach ($answers as $answer) {
        $question_id = isset($answer['question_id']) ? (int) $answer['question_id'] : 0;
        $multiple_choice_answer = isset($answer['multiple_choice_answer']) ? (int) $answer['multiple_choice_answer'] : null;  // null if no answer selected
        $essay_answer = isset($answer['essay_answer']) ? $answer['essay_answer'] : null;
        $points_earned = isset($answer['points_earned']) ? (int) $answer['points_earned'] : 0;  // Points earned is 0 if no answer selected

        // Prepare SQL query to insert the candidate's answer
        $sql = "INSERT INTO tblexamcandidateanswer (examcandA_resultId, examcandA_questionId, examcandA_choiceId, examcandA_essay, examcandA_pointsEarned)
                VALUES (:examcandA_resultId, :examcandA_questionId, :examcandA_choiceId, :examcandA_essay, :examcandA_pointsEarned)";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':examcandA_resultId', $result_id, PDO::PARAM_INT);
        $stmt->bindParam(':examcandA_questionId', $question_id, PDO::PARAM_INT);
        $stmt->bindParam(':examcandA_choiceId', $multiple_choice_answer, PDO::PARAM_INT);
        $stmt->bindParam(':examcandA_essay', $essay_answer, PDO::PARAM_STR);
        $stmt->bindParam(':examcandA_pointsEarned', $points_earned, PDO::PARAM_INT);

        // Execute the query
        $stmt->execute();
      }

      $conn->commit();

      return json_encode(["success" => true, "message" => "Answers inserted successfully."]);
    } catch (PDOException $e) {
      // Rollback in case of error
      $conn->rollBack();
      return json_encode(["success" => false, "message" => "Error inserting answers: " . $e->getMessage()]);
    }
  } else {
    return json_encode(["success" => false, "message" => "Invalid result_id or no answers provided."]);
  }
}


function fetchExamResult($json){
  include "connection.php";

  try {
    $data = json_decode($json, true);

    if (!isset($data['cand_id'])) {
      echo json_encode(["error" => "Missing candidate ID"]);
      return;
    }

    $candId = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

    $sql = "SELECT
              a.examR_score,
              a.examR_totalscore,
              c.jobM_title,
              c.jobM_id,
              a.examR_status,
              DATE(a.examR_date) AS examR_date
          FROM tblexamresult a
          INNER JOIN tblexam b ON a.examR_examId = b.exam_id
          LEFT JOIN tbljobsmaster c ON a.examR_jobMId = c.jobM_id
          INNER JOIN tblcandidates d ON a.examR_candId = d.cand_id
          WHERE a.examR_candId = :cand_id
          ORDER BY a.examR_date DESC;
            ";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId, PDO::PARAM_INT);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($result)) {
      echo json_encode(["message" => "No exam Result found"]);
      return;
    }

    // Convert examR_status to "Passed" or "Failed"
    foreach ($result as &$row) {
      $row['examR_status'] = $row['examR_status'] == 1 ? "Passed" : "Failed";
    }

    echo json_encode($result);

  } catch (PDOException $e) {
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
  }
}

function getJobOffer($json) {
  include "connection.php";

  try {
    $data = json_decode($json, true);

    if (!isset($data['cand_id'])) {
      echo json_encode(["error" => "Missing candidate ID"]);
      return;
    }

    $candId = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;
    $jobMId = isset($data['jobM_id']) ? (int) $data['jobM_id'] : 0;

    $sql = "SELECT
                a.joboffer_id,
                a.joboffer_document,
                a.joboffer_salary,
                a.joboffer_expiryDate,
                b.jobM_title,
                b.jobM_id,
                c.statusjobO_date,
                d.jobofferS_name
            FROM tbljoboffer a
            INNER JOIN tbljobsmaster b ON a.joboffer_jobMId = b.jobM_id
            INNER JOIN tblstatusjoboffer c ON a.joboffer_id = c.statusjobO_jobofferId
            INNER JOIN tbljobofferstatus d ON c.statusjobO_statusId = d.jobofferS_id
            WHERE a.joboffer_candId = :cand_id AND a.joboffer_jobMId = :jobM_id";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId, PDO::PARAM_INT);
    $stmt->bindParam(':jobM_id', $jobMId, PDO::PARAM_INT);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($result)) {
      echo json_encode(["message" => "No job offer found"]);
      return;
    }

    echo json_encode($result);

  } catch (PDOException $e) {
    echo json_encode(["error" => "Database error: " . $e->getMessage()]);
  }
}

function insertCandidateJobOfferResponse($json) {
  include "connection.php";

  try {
      $data = json_decode($json, true);

      if (!isset($data['job_offer_id']) || !isset($data['status'])) {
          echo json_encode(["error" => "Missing required fields"]);
          return;
      }


      $jobOfferId = (int) $data['job_offer_id'];
      $status = $data['status']; // Expected values: 'accept' or 'decline'
      $appId = isset($data['app_id']) ? (int) $data['app_id'] : 0;



      $statusId = ($status === 'accept') ? 1 : 2;


      $sql = "INSERT INTO tblstatusjoboffer (statusjobO_jobofferId, statusjobO_statusId, statusjobO_date)
              VALUES (:job_offer_id, :statusjobO_statusId, NOW())";

      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':job_offer_id', $jobOfferId, PDO::PARAM_INT);

      $stmt->bindParam(':statusjobO_statusId', $statusId, PDO::PARAM_INT);


      if ($stmt->execute()) {

          $appStatusId = ($status === 'accept') ? 11 : 4;
          $sqlStatus = "INSERT INTO tblapplicationstatus (appS_appId, appS_statusId, appS_date)
                        VALUES (:appS_appId, :appS_statusId, NOW())";
          $stmtStatus = $conn->prepare($sqlStatus);
          $stmtStatus->bindParam(':appS_appId', $appId, PDO::PARAM_INT);
          $stmtStatus->bindParam(':appS_statusId', $appStatusId, PDO::PARAM_INT);
          $stmtStatus->execute();

          echo json_encode(["success" => "Response recorded successfully"]);
      } else {
          echo json_encode(["error" => "Failed to record response"]);
      }

  } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
  }
}


function getNotification($json)
{
    date_default_timezone_set('Asia/Manila');
    include "connection.php";
    $data = json_decode($json, true);

    $candId = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

    $sql = "SELECT a.notification_message,
                   a.notification_date,
                   c.status_name,
                   d.cand_firstname,
                   e.jobM_title,
                   e.jobM_id,
                   e.jobM_passpercentage,
                   b.app_id,
                   IFNULL(f.intsched_date, '') AS intsched_date,
                   a.notification_read,
                   IF(a.notification_read = 0, 1, 0) AS is_new,
                   MONTHNAME(a.notification_date) AS month_name 
                   FROM tblnotifications a
                   INNER JOIN tblapplications b ON a.notification_appId = b.app_id
                   INNER JOIN tblstatus c ON a.notification_statusId = c. status_id
                   INNER JOIN tblcandidates d ON a.notification_candId = d.cand_id
                   INNER JOIN tbljobsmaster e ON b.app_jobMId = e.jobM_id
                   LEFT JOIN tblinterviewschedule f ON e.jobM_id = f.intsched_jobId
                   WHERE b.app_candId = :cand_id
                   AND MONTH(a.notification_date) = MONTH(CURDATE()) 
                   ORDER BY a.notification_date DESC;              
                  ";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId, PDO::PARAM_INT);
    $stmt->execute();

    $notifications = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Convert notification_date to relative time
    foreach ($notifications as &$notification) {
        $notification['notification_date'] = timeAgo($notification['notification_date']);
    }

    return $stmt->rowCount() > 0 ? json_encode($notifications) : 0;
}



function markNotificationsAsRead($json)
{
    include "connection.php";
    $data = json_decode($json, true);
    $candId = isset($data['cand_id']) ? (int) $data['cand_id'] : 0;

    $sql = "UPDATE tblnotifications
            SET notification_read = 1
            WHERE notification_read = 0 AND notification_candId = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId, PDO::PARAM_INT);
    $stmt->execute();

    return $stmt->rowCount() > 0;
}


} //user

// function recordExists($value, $table, $column)
// {
//   include "connection.php";
//   $sql = "SELECT COUNT(*) FROM $table WHERE $column = :value";
//   $stmt = $conn->prepare($sql);
//   $stmt->bindParam(":value", $value);
//   $stmt->execute();
//   $count = $stmt->fetchColumn();
//   return $count > 0;
// }

function timeAgo($timestamp)
{
    // Convert the timestamp to Philippine time
    $time = strtotime($timestamp . ' +08:00');
    $diff = time() - $time;

    if ($diff < 60) {
        return $diff . 'sec';
    } elseif ($diff < 3600) {
        return floor($diff / 60) . 'min';
    } elseif ($diff < 86400) {
        return floor($diff / 3600) . 'h';
    } elseif ($diff < 604800) { // 7 days
        return floor($diff / 86400) . 'd';
    } else {
        return floor($diff / 604800) . 'w';
    }
}

function recordExists($value, $table)
{
    include "connection.php";

    // Prepare SQL query to check existence in both cand_email and cand_alternateEmail
    $sql = "SELECT COUNT(*) FROM $table WHERE cand_email = :value OR cand_alternateEmail = :value";
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

// $input = json_decode(file_get_contents('php://input'), true);



$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";
$json = isset($_POST["json"]) ? $_POST["json"] : "0";

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
  case "getCourseType":
    echo $user->getCourseType();
    break;
  case "sendEmail":
    echo $user->sendEmail($json);
    break;
   case "getActiveJobs":
    echo $user->getActiveJobs();
    break;
  case "getActiveJob":
    echo $user->getActiveJob($json);
    break;
  case "getAppliedJobs":
    echo $user->getAppliedJobs($json);
    break;
  case "applyForJob":
    echo $user->applyForJob();
    break;
  case "cancelJobApplied":
    echo $user->cancelJobApplied($json);
    break;
  case "getPinCode":
    echo $user->getPinCode($json);
    break;
  case "getPinCodeUpdate":
    echo $user->getPinCodeUpdate($json);
    break;
  case "getPinCodeEmailUpdate":
    echo $user->getPinCodeEmailUpdate($json);
    break;

  case "getSkills":
    echo $user->getSkills();
    break;
  case "getTraining":
    echo $user->getTraining();
    break;
  case "getLicense":
    echo $user->getLicense();
    break;
  case "getLicenseType":
    echo $user->getLicenseType();
    break;
  case "getKnowledge":
    echo $user->getKnowledge();
    break;
  case "isEmailExist":
    echo $user->isEmailExist($json);
    break;

  case "getAllDataForDropdownSignup":
    echo $user->getAllDataForDropdownSignup();
    break;
  case "getCandidateProfile":
    echo $user->getCandidateProfile($json);
    break;
  case "updateCandidatePersonalInfo":
    echo $user->updateCandidatePersonalInfo($json);
    break;
  case "updateEducationalBackground":
    echo $user->updateEducationalBackground($json);
    break;
  case "updateCandidateEmploymentInfo":
    echo $user->updateCandidateEmploymentInfo($json);
    break;
  case "updateCandidateSkills":
    echo $user->updateCandidateSkills($json);
    break;
  case "getCourseCategory":
    echo $user->getCourseCategory();
    break;
  case "updateCandidateTraining":
    echo $user->updateCandidateTraining($json);
    break;
  case "updateCandidateKnowledge":
    echo $user->updateCandidateKnowledge($json);
    break;
  case "updateCandidateLicense":
    echo $user->updateCandidateLicense($json);
    break;
  case "deleteEducationalBackground":
    echo $user->deleteEducationalBackground($json);
    break;
  case "updateEmailPassword":
    echo $user->updateEmailPassword($json);
    break;
  case "updatePassword":
    echo $user->updatePassword($json);
    break;
  case "getCandidateExpectedKeywords":
    echo $user->getCandidateExpectedKeywords($json);
    break;
  case "updateCandidateResume":
    echo $user->updateCandidateResume($json);
    break;
  case "getJobExam":
    echo $user->getJobExam($json);
    break;
  case "insertExamResult":
    echo $user->insertExamResult($json);
    break;
  case "insertCandidateAnswers":
    echo $user->insertCandidateAnswers($json);
    break;
  case "fetchExamResult":
    echo $user->fetchExamResult($json);
    break;
  case "getJobOffer":
    echo $user->getJobOffer($json);
    break;
  case "insertCandidateJobOfferResponse":
    echo $user->insertCandidateJobOfferResponse($json);
    break;
  case "getNotification":
    echo $user->getNotification($json);
    break;
  case "markNotificationsAsRead":
    echo $user->markNotificationsAsRead($json);
    break;
  case "timeAgo":
    echo timeAgo($timestamp);
    break;
  default:
    echo json_encode("WALA KA NAGBUTANG OG OPERATION SA UBOS HAHAHHA BOBO");
    http_response_code(400); // Bad Request
    break;
}