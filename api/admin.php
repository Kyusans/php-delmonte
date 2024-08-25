<?php
include "headers.php";

// tbljobsmaster
//  - jobM_id
//  - jobM_title
//  - jobM_description

// tbljobsmasterduties
//  - duties_id
//  - duties_jobId
//  - duties_text

// QUALIFICATIONS - this is where we are going to match the appplicants' qualifications

// tbljobseducation
//  - jeduc_id
//  - jeduc_jobId
//  - jeduc_categoryId

// tbljobstrainings
//  - jtrng_id
//  - jtrng_jobId
//  - jtrng_trainingId

// tbljobsknowledge
//  - jknow_id
//  - jknow_jobId
//  - jknow_knowledgeId

// tbljobsskills
//  - jskills_id
//  - jskills_jobId
//  - jskills_skillsId

// tbljobsworkexperience
//  - jwork_id
//  - jwork_jobId
//  - jwork_duration
//  - jwork_responsibilities



// Knowledge and Compliance
// - Good Manufacturing Practices (GMP)
// - Quality Management Practices (QMP)
// - Hazard Analysis and Critical Control Points (HACCP)
// - Food Safety Management Systems (FSMS)

// Technical Training
//  - Manufacturing Operations
//  - 5S (Workplace Organization Methodology)
//  - MS Office (Microsoft Office Suite)
//  - Statistical Process Control (SPC)
//  - Occupational Safety and Health

class Admin
{
  function addJobMaster($json){

    // {
    //   "jobMaster": {
    //     "title": "Software Developer",
    //     "description": "Responsible for developing and maintaining software applications."
    //   },
    //   "jobMasterDuties": [
    //     {
    //       "dutiesText": "Design and implement software solutions."
    //     },
    //     {
    //       "dutiesText": "Collaborate with cross-functional teams."
    //     }
    //   ],
    //   "jobEducation": [
    //     {
    //       "categoryId": 1
    //     },
    //     {
    //       "categoryId": 2
    //     }
    //   ],
    //   "jobTraining": [
    //     {
    //       "trainingId": 1
    //     },
    //     {
    //       "trainingId": 2
    //     }
    //   ],
    //   "jobKnowledge": [
    //     {
    //       "knowledgeId": 201
    //     },
    //     {
    //       "knowledgeId": 202
    //     }
    //   ],
    //   "jobSkills": [
    //     {
    //       "skillId": 301
    //     },
    //     {
    //       "skillId": 302
    //     }
    //   ],
    //   "jobWorkExperience": [
    //     {
    //       "duration": "2",
    //       "responsibilities": "Developed web applications using React.js."
    //     },
    //     {
    //       "duration": "3",
    //       "responsibilities": "Led a team of developers in creating mobile apps."
    //     }
    //   ]
    // }
    
    include "connection.php";
    $conn->beginTransaction();
    $data = json_decode($json, true);

    $jobMaster = $data['jobMaster'];
    $jobMasterDuties = $data['jobMasterDuties'];
    $jobEducation = $data['jobEducation'];
    $jobTraining = $data['jobTraining'];
    $jobKnowledge = $data['jobKnowledge'];
    $jobSkills = $data['jobSkills'];
    $jobWorkExperience = $data['jobWorkExperience'];

    try {

      $sql = "INSERT INTO tbljobsmaster (jobM_title, jobM_description) VALUES (:jobM_title, :jobM_description)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobM_title", $jobMaster['title']);
      $stmt->bindParam(":jobM_description", $jobMaster['description']);
      $stmt->execute();

      $jobMasterId = $conn->lastInsertId();

      $sql = "INSERT INTO tbljobsmasterduties (duties_jobId, duties_text) VALUES (:duties_jobId, :duties_text)";
      foreach ($jobMasterDuties as $duty) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":duties_jobId", $jobMasterId);
        $stmt->bindParam(":duties_text", $duty['dutiesText']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobseducation (jeduc_jobId, jeduc_categoryId) VALUES (:jeduc_jobId, :jeduc_categoryId)";
      foreach ($jobEducation as $education) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jeduc_jobId", $jobMasterId);
        $stmt->bindParam(":jeduc_categoryId", $education['categoryId']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobstrainings (jtrng_jobId, jtrng_trainingId) VALUES (:jtrng_jobId, :jtrng_trainingId)";
      foreach ($jobTraining as $training) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jtrng_jobId", $jobMasterId);
        $stmt->bindParam(":jtrng_trainingId", $training['trainingId']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobsknowledge (jknow_jobId, jknow_knowledgeId) VALUES (:jknow_jobId, :jknow_knowledgeId)";
      foreach ($jobKnowledge as $knowledge) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jknow_jobId", $jobMasterId);
        $stmt->bindParam(":jknow_knowledgeId", $knowledge['knowledgeId']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobsskills (jskills_jobId, jskills_skillsId) VALUES (:jskills_jobId, :jskills_skillsId)";
      foreach ($jobSkills as $skill) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jskills_jobId", $jobMasterId);
        $stmt->bindParam(":jskills_skillsId", $skill['skillId']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobsworkexperience (jwork_jobId, jwork_duration, jwork_responsibilities) VALUES (:jwork_jobId, :jwork_duration, :jwork_responsibilities)";
      foreach ($jobWorkExperience as $experience) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jwork_jobId", $jobMasterId);
        $stmt->bindParam(":jwork_duration", $experience['duration']);
        $stmt->bindParam(":jwork_responsibilities", $experience['responsibilities']);
        $stmt->execute();
      }
      $conn->commit();
      return 1;
    } catch (PDOException $th) {
      $conn->rollBack();
      return 0;
    }
  }
} //admin

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

$json = isset($_POST["json"]) ? $_POST["json"] : "0";
$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";

$user = new Admin();

switch ($operation) {
  case"addJobMaster":
    echo $user->addJobMaster($json);
    break;
  default:
    echo "WALA KA NAGBUTANG OG OPERATION SA UBOS HAHAHHA BOBO";
    break;
}
