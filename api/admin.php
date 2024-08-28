<?php
include "headers.php";

class Admin
{
  function addJobMaster($json)
  {

    // {
    //   "jobMaster": {"title": "Sample Job Title", "description": "A detailed job description that outlines the main duties, responsibilities, and qualifications required for this position."},
    //   "jobMasterDuties": [
    //     {"duties": "Oversee daily operations and ensure smooth workflow across all departments, with a focus on efficiency and quality."},
    //     {"duties": "Develop and implement strategic plans to achieve organizational goals, enhancing productivity and profitability."},
    //     {"duties": "Lead and mentor a team of professionals, fostering a collaborative environment and encouraging continuous learning."}
    //   ],
    //   "jobEducation": [
    //     {"courseCategory": 4, "jobEducation": "Bachelor's degree in Business Administration or a related field, providing a solid foundation in management principles."},
    //     {"courseCategory": 3, "jobEducation": "Master's degree in Business Administration or a related field, focusing on advanced business strategies and leadership skills."}
    //   ],
    //   "jobTraining": [
    //     {"training": 3, "jobTraining": "Certified Project Management Professional (PMP) training to enhance project management skills and knowledge."},
    //     {"training": 2, "jobTraining": "Leadership development program designed to equip leaders with the skills necessary to drive team performance and business success."},
    //     {"training": 1, "jobTraining": "Advanced Excel training for data analysis, financial modeling, and complex calculations, providing essential tools for business decisions."}
    //   ],
    //   "jobKnowledge": [
    //     {"jobKnowledge": "In-depth knowledge of business processes, operations management, and strategic planning, with a focus on maximizing efficiency."},
    //     {"jobKnowledge": "Strong understanding of financial management, including budgeting, forecasting, and financial analysis to support decision-making."},
    //     {"jobKnowledge": "Comprehensive knowledge of human resources management, including recruitment, training, performance evaluation, and employee relations."}
    //   ],
    //   "jobSkill": [
    //     {"skill": 3, "jobSkill": "Excellent communication and interpersonal skills, enabling effective collaboration and relationship-building with stakeholders at all levels."},
    //     {"skill": 2, "jobSkill": "Proficient in data analysis and interpretation, with the ability to translate complex data into actionable insights."},
    //     {"skill": 1, "jobSkill": "Strong leadership and team management abilities, with a proven track record of driving team performance and achieving targets."}
    //   ],
    //   "jobExperience": [
    //     {"yearsOfExperience": "8", "jobExperience": "Extensive experience in operations management, with a proven ability to optimize processes and improve efficiency."},
    //     {"yearsOfExperience": "15", "jobExperience": "Significant experience in strategic planning and business development, with a focus on driving growth and profitability."},
    //     {"yearsOfExperience": "20", "jobExperience": "Comprehensive experience in leading cross-functional teams, fostering a collaborative environment, and achieving organizational objectives."}
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
    $jobSkills = $data['jobSkill'];
    $jobWorkExperience = $data['jobExperience'];

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
        $stmt->bindParam(":duties_text", $duty['duties']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobseducation (jeduc_jobId, jeduc_text, jeduc_categoryId) VALUES (:jeduc_jobId, :jeduc_text, :jeduc_categoryId)";
      foreach ($jobEducation as $education) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jeduc_jobId", $jobMasterId);
        $stmt->bindParam(":jeduc_text", $education['jobEducation']);
        $stmt->bindParam(":jeduc_categoryId", $education['courseCategory']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobstrainings (jtrng_jobId, jtrng_text, jtrng_trainingId) VALUES (:jtrng_jobId, :jtrng_text, :jtrng_trainingId)";
      foreach ($jobTraining as $training) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jtrng_jobId", $jobMasterId);
        $stmt->bindParam(":jtrng_text", $training['jobTraining']);
        $stmt->bindParam(":jtrng_trainingId", $training['training']);
        $stmt->execute();
      }

      // $sql = "INSERT INTO tbljobsknowledge (jknow_jobId, jknow_text, jknow_knowledgeId) VALUES (:jknow_jobId, :jknow_knowledgeId)";
      $sql = "INSERT INTO tbljobsknowledge (jknow_jobId, jknow_text) VALUES (:jknow_jobId, :jknow_text)";
      foreach ($jobKnowledge as $knowledge) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jknow_jobId", $jobMasterId);
        $stmt->bindParam(":jknow_text", $knowledge['jobKnowledge']);
        // $stmt->bindParam(":jknow_knowledgeId", $knowledge['jobKnowledge']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobsskills (jskills_jobId, jskills_text, jskills_skillsId) VALUES (:jskills_jobId, :jskills_text, :jskills_skillsId)";
      foreach ($jobSkills as $skill) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jskills_jobId", $jobMasterId);
        $stmt->bindParam(":jskills_text", $skill['jobSkill']);
        $stmt->bindParam(":jskills_skillsId", $skill['skill']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobsworkexperience (jwork_jobId, jwork_duration, jwork_responsibilities) VALUES (:jwork_jobId, :jwork_duration, :jwork_responsibilities)";
      foreach ($jobWorkExperience as $experience) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jwork_jobId", $jobMasterId);
        $stmt->bindParam(":jwork_duration", $experience['yearsOfExperience']);
        $stmt->bindParam(":jwork_responsibilities", $experience['jobExperience']);
        $stmt->execute();
      }
      $conn->commit();
      return 1;
    } catch (PDOException $th) {
      $conn->rollBack();
      return $th;
    }
  }

  function getAllJobs()
  {
    include "connection.php";
    $sql = "SELECT a.*, COUNT(b.posA_id ) as Total_Applied 
              FROM tbljobsmaster a  
              LEFT JOIN tblpositionapplied b 
              ON a.jobM_id = b.posA_jobMId  
              GROUP BY a.	jobM_id 
              ORDER BY a.jobM_id DESC";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function getDropDownForAddJobs()
  {
    try {
      $data = [];
      include "connection.php";
      $conn->beginTransaction();
      $sql = "SELECT * FROM tblcoursescategory";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['courseCategory'] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

      $sql = "SELECT * FROM tblpersonaltraining";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['personalTraining'] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

      $sql = "SELECT * FROM tblpersonalskills";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['personalSkills'] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

      $sql = "SELECT * FROM tblknowledge";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['knowledge'] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

      $conn->commit();
      return json_encode($data);
    } catch (PDOException $th) {
      $conn->rollBack();
      return 0;
    }
  }

  function getSelectedJobs($json)
  {
    include "connection.php";
    $returnValue = [];
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tbljobsmaster WHERE jobM_id = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobMaster"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobsmasterduties WHERE duties_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobDuties"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobseducation WHERE jeduc_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobEducation"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobstrainings WHERE jtrng_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobTrainings"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobsknowledge WHERE jknow_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobKnowledge"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobsskills WHERE jskills_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobSkills"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobsworkexperience WHERE jwork_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobExperience"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT b.cand_id, CONCAT(b.cand_lastname, ', ', b.cand_firstname, ' ', b.cand_middlename) as FullName, a.posA_totalpoints FROM tblpositionapplied a 
            INNER JOIN tblcandidates b ON a.posA_candId = b.cand_id 
            WHERE a.posA_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["candidates"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    return json_encode($returnValue);
  }

  function getLookUpTables(){
    include "connection.php";
    $returnValue = [];
    $sql = "SELECT * FROM tblcourses";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["courses"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tblcoursescategory";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["courseCategory"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tblinstitution";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["institution"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tblpersonalskills";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["skills"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tblpersonaltraining";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["training"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    return json_encode($returnValue);
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
  case "addJobMaster":
    echo $user->addJobMaster($json);
    break;
  case "getAllJobs":
    echo $user->getAllJobs();
    break;
  case "getDropDownForAddJobs":
    echo $user->getDropDownForAddJobs();
    break;
  case "getSelectedJobs":
    echo $user->getSelectedJobs($json);
    break;
  case "getLookUpTables":
    echo $user->getLookUpTables();
    break;
  default:
    echo "WALA KA NAGBUTANG OG OPERATION SA UBOS HAHAHHA BOBO";
    break;
}
