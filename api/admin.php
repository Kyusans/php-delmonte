<?php
include "headers.php";

class Admin
{

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
  function addJobMaster($json)
  {
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
    $todayDate = $this->getCurrentDate();

    try {
      $sql = "INSERT INTO tbljobsmaster (jobM_title, jobM_description, jobM_status, jobM_createdAt) VALUES (:jobM_title, :jobM_description, :jobM_status, :jobM_createdAt)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobM_title", $jobMaster['title']);
      $stmt->bindParam(":jobM_description", $jobMaster['description']);
      $stmt->bindParam(":jobM_status", $jobMaster['isJobActive']);
      $stmt->bindParam(":jobM_createdAt", $todayDate);
      $stmt->execute();

      $jobMasterId = $conn->lastInsertId();

      $sql = "INSERT INTO tbljobpassing (passing_jobId, passing_points) VALUES (:passing_jobId, :passing_points)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":passing_jobId", $jobMasterId);
      $stmt->bindParam(":passing_points", $jobMaster['passingPercentage']);
      $stmt->execute();
      $sql = "INSERT INTO tbljobsmasterduties (duties_jobId, duties_text) VALUES (:duties_jobId, :duties_text)";
      foreach ($jobMasterDuties as $duty) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":duties_jobId", $jobMasterId);
        $stmt->bindParam(":duties_text", $duty['duties']);
        $stmt->execute();
      }
      // jeduc_text
      $sql = "INSERT INTO tbljobseducation (jeduc_jobId, jeduc_categoryId, jeduc_points) VALUES (:jeduc_jobId, :jeduc_categoryId, :points)";
      foreach ($jobEducation as $education) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jeduc_jobId", $jobMasterId);
        // $stmt->bindParam(":jeduc_text", $education['jobEducation']);
        $stmt->bindParam(":jeduc_categoryId", $education['courseCategory']);
        $stmt->bindParam(":points", $education['points']);
        $stmt->execute();
      }
      // jtrng_text
      $sql = "INSERT INTO tbljobstrainings (jtrng_jobId, jtrng_trainingId, jtrng_points) VALUES (:jtrng_jobId, :jtrng_trainingId, :points)";
      foreach ($jobTraining as $training) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jtrng_jobId", $jobMasterId);
        // $stmt->bindParam(":jtrng_text", $training['jobTraining']);
        $stmt->bindParam(":jtrng_trainingId", $training['training']);
        $stmt->bindParam(":points", $training['points']);
        $stmt->execute();
      }
      // jknow_text
      $sql = "INSERT INTO tbljobsknowledge (jknow_jobId, jknow_knowledgeId, jknow_points) VALUES (:jknow_jobId, :jknow_knowledgeId, :points)";
      foreach ($jobKnowledge as $knowledge) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jknow_jobId", $jobMasterId);
        // $stmt->bindParam(":jknow_text", $knowledge['jobKnowledge']);
        $stmt->bindParam(":jknow_knowledgeId", $knowledge['knowledgeId']);
        $stmt->bindParam(":points", $knowledge['points']);
        $stmt->execute();
      }
      // jskills_text
      $sql = "INSERT INTO tbljobsskills (jskills_jobId, jskills_skillsId, jskills_points) VALUES (:jskills_jobId, :jskills_skillsId, :points)";
      foreach ($jobSkills as $skill) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jskills_jobId", $jobMasterId);
        // $stmt->bindParam(":jskills_text", $skill['jobSkill']);
        $stmt->bindParam(":jskills_skillsId", $skill['skill']);
        $stmt->bindParam(":points", $skill['points']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tbljobsworkexperience (jwork_jobId, jwork_duration, jwork_responsibilities, jwork_points) VALUES (:jwork_jobId, :jwork_duration, :jwork_responsibilities, :points)";
      foreach ($jobWorkExperience as $experience) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jwork_jobId", $jobMasterId);
        $stmt->bindParam(":jwork_duration", $experience['yearsOfExperience']);
        $stmt->bindParam(":jwork_responsibilities", $experience['jobExperience']);
        $stmt->bindParam(":points", $experience['points']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tblinterviewpassingpercent(passing_jobId, passing_percent) VALUES (:passing_jobId, 50)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":passing_jobId", $jobMasterId);
      $stmt->execute();
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
    $sql = "SELECT a.*, COUNT(b.app_id) as Total_Applied 
              FROM tbljobsmaster a  
              LEFT JOIN tblapplications b 
              ON a.jobM_id = b.app_jobMId  
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

      $sql = "SELECT * FROM tblpersonalknowledge";
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
    // {"jobId": 11}
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

    $sql = "SELECT a.*, b.course_categoryName  FROM tbljobseducation a 
            INNER JOIN tblcoursescategory b ON b.course_categoryId = a.jeduc_categoryId
            WHERE jeduc_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobEducation"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.*, b.perT_name FROM tbljobstrainings a
            INNER JOIN tblpersonaltraining b ON b.perT_id = a.jtrng_trainingId
            WHERE jtrng_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobTrainings"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.*, b.knowledge_name FROM tbljobsknowledge a
            INNER JOIN tblpersonalknowledge b ON b.knowledge_id = a.jknow_knowledgeId
            WHERE jknow_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobKnowledge"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.*, b.perS_name FROM tbljobsskills a
            INNER JOIN tblpersonalskills b ON b.perS_id = a.jskills_skillsId
            WHERE jskills_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobSkills"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobsworkexperience WHERE jwork_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobExperience"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT passing_points as passing_percentage FROM tbljobpassing WHERE passing_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobPassing"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tblstatus";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["status"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT b.cand_id, CONCAT(b.cand_lastname, ', ', b.cand_firstname, ' ', b.cand_middlename) AS FullName, e.status_name
            FROM tblapplications a
            INNER JOIN tblcandidates b ON a.app_candId = b.cand_id
            INNER JOIN tblapplicationstatus d ON d.appS_appId = a.app_id
            INNER JOIN tblstatus e ON e.status_id = d.appS_statusId
            WHERE a.app_jobMId = :jobId
            AND d.appS_date = (SELECT MAX(sub_d.appS_date) 
            FROM tblapplicationstatus sub_d 
            WHERE sub_d.appS_appId = d.appS_appId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["candidates"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
    $returnValue["interview"] = $this->getJobInterviewDetails($data);
    $returnValue['exam'] = $this->getExamDetails($data['jobId']);
    foreach ($returnValue["candidates"] as &$candidate) {
      $candidate['points'] = $this->calculateCandidatePoints($candidate['cand_id'], $data['jobId']);
    }
    return json_encode($returnValue);
  }

  function calculateCandidatePoints($candId, $jobId)
  {
    include "connection.php";
    $totalPoints = 0;
    $maxPoints = 0;

    // Education Points
    $sql = "SELECT SUM(DISTINCT c.jeduc_points) as educ_points, 
          (SELECT SUM(jeduc_points) FROM tbljobseducation WHERE jeduc_jobId = :jobId) as max_educ_points
          FROM tblcourses a
          INNER JOIN tblcoursescategory b ON b.course_categoryId = a.courses_coursecategoryId
          INNER JOIN tbljobseducation c ON c.jeduc_categoryId = b.course_categoryId
          INNER JOIN tblcandeducbackground d ON d.educ_coursesId = a.courses_id
          WHERE d.educ_canId = :candId AND c.jeduc_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $educationPoints = $result['educ_points'] ?? 0;
    $maxEducationPoints = $result['max_educ_points'] ?? 0;
    $totalPoints += $educationPoints;
    $maxPoints += $maxEducationPoints;

    // Work Experience Points
    $sql = "SELECT SUM(DISTINCT a.jwork_points) AS exp_points, 
          (SELECT SUM(jwork_points) FROM tbljobsworkexperience WHERE jwork_jobId = :jobId) AS max_exp_points
          FROM tbljobsworkexperience a
          INNER JOIN tblapplications b ON b.app_jobMId = a.jwork_jobId
          INNER JOIN tblcandemploymenthistory c ON c.empH_candId = b.app_candId
          WHERE INSTR(a.jwork_responsibilities, c.empH_positionName) > 0
          AND c.empH_candId = :candId AND a.jwork_jobId = :jobId
          AND TIMESTAMPDIFF(YEAR, c.empH_startDate, c.empH_endDate) >= a.jwork_duration";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $experiencePoints = $result['exp_points'] ?? 0;
    $maxExperiencePoints = $result['max_exp_points'] ?? 0;
    $totalPoints += $experiencePoints;
    $maxPoints += $maxExperiencePoints;

    // Skills Points
    $sql = "SELECT SUM(DISTINCT j.jskills_points) as skills_points, 
          (SELECT SUM(jskills_points) FROM tbljobsskills WHERE jskills_jobId = :jobId) as max_skills_points
          FROM tbljobsskills j 
          INNER JOIN tblcandskills c ON j.jskills_skillsId = c.skills_perSId 
          WHERE c.skills_candId = :candId AND j.jskills_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $skillsPoints = $result['skills_points'] ?? 0;
    $maxSkillsPoints = $result['max_skills_points'] ?? 0;
    $totalPoints += $skillsPoints;
    $maxPoints += $maxSkillsPoints;

    // Training Points
    $sql = "SELECT SUM(DISTINCT j.jtrng_points) as training_points, 
          (SELECT SUM(jtrng_points) FROM tbljobstrainings WHERE jtrng_jobId = :jobId) as max_training_points
          FROM tbljobstrainings j 
          INNER JOIN tblcandtraining c ON j.jtrng_trainingId = c.training_perTId 
          WHERE c.training_candId = :candId AND j.jtrng_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $trainingPoints = $result['training_points'] ?? 0;
    $maxTrainingPoints = $result['max_training_points'] ?? 0;
    $totalPoints += $trainingPoints;
    $maxPoints += $maxTrainingPoints;

    // Knowledge Points
    $sql = "SELECT SUM(DISTINCT j.jknow_points) as knowledge_points, 
          (SELECT SUM(jknow_points) FROM tbljobsknowledge WHERE jknow_jobId = :jobId) as max_knowledge_points
          FROM tbljobsknowledge j 
          INNER JOIN tblcandknowledge c ON j.jknow_knowledgeId = c.canknow_knowledgeId 
          WHERE c.canknow_canId = :candId AND j.jknow_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $knowledgePoints = $result['knowledge_points'] ?? 0;
    $maxKnowledgePoints = $result['max_knowledge_points'] ?? 0;
    $totalPoints += $knowledgePoints;
    $maxPoints += $maxKnowledgePoints;

    // Calculate percentage
    $percentage = ($maxPoints > 0) ? round(($totalPoints / $maxPoints) * 100, 2) : 0;

    return [
      'maxPoints' => $maxPoints,
      'totalPoints' => $totalPoints,
      'percentage' => $percentage,
    ];
  }

  function getLookUpTables()
  {
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

  function handleJobStatusSwitch($json)
  {
    // {"status": 1, "jobId": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobsmaster SET jobM_status = :status WHERE jobM_id = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":status", $data['status']);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getAllDataForDropdownUpdate()
  {
    include "connection.php";
    $conn->beginTransaction();
    try {
      $data = [];

      $sql = "SELECT * FROM tblcoursescategory";
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $data['courseCategory'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

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

      $conn->commit();

      return json_encode($data);
    } catch (\Throwable $th) {
      $conn->rollBack();
      return 0;
    }
  }

  function getDuties($json)
  {
    // {"jobId": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tbljobsmasterduties WHERE duties_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function addDuties($json)
  {
    // {"duties": "duties", "jobId": 3}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobsmasterduties (duties_jobId, duties_text) VALUES (:jobId, :duties)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":duties", $data['duties']);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateDuties($json)
  {
    // {"duties": "duties", "dutyId": 3}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobsmasterduties SET duties_text = :duties WHERE duties_id = :dutyId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":duties", $data['duties']);
    $stmt->bindParam(":dutyId", $data['dutyId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteDuties($json)
  {
    // {"dutyId": 3}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobsmasterduties WHERE duties_id = :dutyId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":dutyId", $data['dutyId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getJobEducation($json)
  {
    // {"jobId": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tbljobseducation WHERE jeduc_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function addJobEducation($json)
  {
    // {"points": 10, "courseCategory": 3, "jobId": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobseducation (jeduc_points, jeduc_categoryId, jeduc_jobId) VALUES (:points, :courseCategory, :jobId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":courseCategory", $data['courseCategory']);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateJobEducation($json)
  {
    // {"points": 10, "courseCategory": 3, "jobId": 11, "id": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobseducation SET jeduc_points = :points, jeduc_categoryId = :courseCategory WHERE jeduc_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":courseCategory", $data['courseCategory']);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobEducation($json)
  {
    // {"id": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobseducation WHERE jeduc_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getJobSkills($json)
  {
    // {"jobId": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tbljobsskills WHERE jskills_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function updateJobSkills($json)
  {
    // {"id": 3, "skillId": 3, "points": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobsskills SET jskills_skillsId = :skillId, jskills_points = :points WHERE jskills_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":skillId", $data['skillId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function addJobSkills($json)
  {
    // {"jobId": 11, "skillId": 3, "points": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobsskills (jskills_jobId, jskills_skillsId, jskills_points) 
            VALUES (:jobId, :skillId, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":skillId", $data['skillId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobSkills($json)
  {
    // {"id": 3}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobsskills WHERE jskills_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getJobTraining($json)
  {
    // {"jobId": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tbljobstrainings WHERE jtrng_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function addJobTraining($json)
  {
    // {"jobId": 11, "trainingId": 3, "points": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobstrainings (jtrng_jobId, jtrng_trainingId, jtrng_points) 
            VALUES (:jobId, :trainingId, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":trainingId", $data['trainingId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateJobTraining($json)
  {
    // {"id": 10, "trainingId": 3, "points": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobstrainings SET jtrng_trainingId = :trainingId, jtrng_points = :points WHERE jtrng_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":trainingText", $data['trainingText']);
    $stmt->bindParam(":trainingId", $data['trainingId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobTraining($json)
  {
    // {"id": 3}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobstrainings WHERE jtrng_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getJobExperience($json)
  {
    // {"jobId": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tbljobsworkexperience WHERE jwork_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function addJobExperience($json)
  {
    // {"jobId": 11, "experienceText": "experience", "yearsOfExperience": 2, "points": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobsworkexperience(jwork_jobId, jwork_responsibilities, jwork_duration, jwork_points) 
            VALUES (:jobId, :experienceText, :yearsOfExperience, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":experienceText", $data['experienceText']);
    $stmt->bindParam(":yearsOfExperience", $data['yearsOfExperience']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateJobExperience($json)
  {
    // {"id": 7, "experienceText": "experiencsadqweasdwqee", "yearsOfExperience": 2, "points": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobsworkexperience SET jwork_responsibilities = :experienceText, jwork_duration = :yearsOfExperience, jwork_points = :points WHERE jwork_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":experienceText", $data['experienceText']);
    $stmt->bindParam(":yearsOfExperience", $data['yearsOfExperience']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobExperience($json)
  {
    // {"id": 7}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobsworkexperience WHERE jwork_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getJobKnowledge($json)
  {
    // {"jobId": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tbljobsknowledge WHERE jknow_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function addJobKnowledge($json)
  {
    // {"jobId": 11, "points": 10, "knowledgeId": 2}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobsknowledge(jknow_jobId, jknow_points, jknow_knowledgeId) VALUES (:jobId, :points, :knowledgeId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":knowledgeId", $data['knowledgeId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateJobKnowledge($json)
  {
    // {"id": 11, "points": 10, "knowledgeId": 2}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobsknowledge SET jknow_points = :points, jknow_knowledgeId = :knowledgeId WHERE jknow_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":knowledgeId", $data['knowledgeId']);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobKnowledge($json)
  {
    // {"id": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobsknowledge WHERE jknow_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":id", $data['id']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function fetchEducationalBackground($cand_id)
  {
    include "connection.php";
    $sql = "SELECT b.courses_name, c.institution_name, a.educ_dategraduate, d.course_categoryName, e.crs_type_name, a.educ_back_id, b.courses_id, c.institution_id 
    FROM tblcandeducbackground a
    INNER JOIN tblcourses b ON a.educ_coursesId = b.courses_id
    INNER JOIN tblinstitution c ON a.educ_institutionId = c.institution_id
    INNER JOIN tblcoursescategory d ON b.courses_coursecategoryId = d.course_categoryId
    INNER JOIN tblcoursetype e ON b.courses_courseTypeId = e.crs_type_id
    WHERE educ_canId = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
  }

  function fetchEmploymentHistory($cand_id)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcandemploymenthistory WHERE empH_candId = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
  }

  function fetchSkills($cand_id)
  {
    include "connection.php";
    $sql = "SELECT b.perS_name, b.perS_id, a.skills_id, a.skills_perSId 
    FROM tblcandskills a
    INNER JOIN tblpersonalskills b ON a.skills_perSId = b.perS_id
    WHERE a.skills_candId = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
  }

  function fetchTraining($cand_id)
  {
    include "connection.php";
    $sql = "SELECT b.perT_name, a.training_id, b.perT_id, a.training_perTId 
    FROM tblcandtraining a
    INNER JOIN tblpersonaltraining b ON a.training_perTId = b.perT_id
    WHERE a.training_candId = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
  }

  function fetchKnowledge($cand_id)
  {
    include "connection.php";
    $sql = "SELECT b.knowledge_name, a.canknow_id, a.canknow_knowledgeId 
    FROM tblcandknowledge a
    INNER JOIN tblpersonalknowledge b ON a.canknow_knowledgeId = b.knowledge_id
    WHERE a.canknow_canId = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
  }

  function getCandidateProfile($json)
  {
    // {"cand_id": 7, "job_id": 11}
    include "connection.php";
    $returnValue = [];
    $data = json_decode($json, true);

    $cand_id = $data['cand_id'];
    $job_id = $data['job_id'];

    // Fetch candidate's basic information
    $sql = "SELECT * FROM tblcandidates WHERE cand_id = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->execute();
    $returnValue["candidateInformation"] = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];

    // Initialize points by category
    $pointsByCategory = [
      'education' => ['points' => 0, 'maxPoints' => 0],
      'experience' => ['points' => 0, 'maxPoints' => 0],
      'skills' => ['points' => 0, 'maxPoints' => 0],
      'training' => ['points' => 0, 'maxPoints' => 0],
      'knowledge' => ['points' => 0, 'maxPoints' => 0],
    ];

    // Education Points
    $sql = "SELECT SUM(DISTINCT je.jeduc_points) AS educ_points, 
            (SELECT SUM(jeduc_points) FROM tbljobseducation WHERE jeduc_jobId = :job_id) AS max_educ_points
            FROM tbljobseducation je
            LEFT JOIN tblcandeducbackground eb ON je.jeduc_categoryId = (
                SELECT b.courses_coursecategoryId FROM tblcourses b WHERE b.courses_id = eb.educ_coursesId
            )
            WHERE eb.educ_canId = :cand_id AND je.jeduc_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $pointsByCategory['education']['points'] = $result['educ_points'] ?? 0;
    $pointsByCategory['education']['maxPoints'] = $result['max_educ_points'] ?? 0;

    // Experience Points
    $sql = "SELECT SUM(DISTINCT jwe.jwork_points) AS exp_points, 
            (SELECT SUM(jwork_points) FROM tbljobsworkexperience WHERE jwork_jobId = :job_id) AS max_exp_points
            FROM tbljobsworkexperience jwe
            LEFT JOIN tblcandemploymenthistory ceh ON jwe.jwork_responsibilities LIKE CONCAT('%', ceh.empH_positionName, '%')
            WHERE ceh.empH_candId = :cand_id AND jwe.jwork_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $pointsByCategory['experience']['points'] = $result['exp_points'] ?? 0;
    $pointsByCategory['experience']['maxPoints'] = $result['max_exp_points'] ?? 0;

    // Skills Points
    $sql = "SELECT SUM(DISTINCT js.jskills_points) AS skills_points, 
            (SELECT SUM(jskills_points) FROM tbljobsskills WHERE jskills_jobId = :job_id) AS max_skills_points
            FROM tbljobsskills js
            LEFT JOIN tblcandskills cs ON js.jskills_skillsId = cs.skills_perSId
            WHERE cs.skills_candId = :cand_id AND js.jskills_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $pointsByCategory['skills']['points'] = $result['skills_points'] ?? 0;
    $pointsByCategory['skills']['maxPoints'] = $result['max_skills_points'] ?? 0;

    // Training Points
    $sql = "SELECT SUM(DISTINCT jt.jtrng_points) AS training_points, 
            (SELECT SUM(jtrng_points) FROM tbljobstrainings WHERE jtrng_jobId = :job_id) AS max_training_points
            FROM tbljobstrainings jt
            LEFT JOIN tblcandtraining ct ON jt.jtrng_trainingId = ct.training_perTId
            WHERE ct.training_candId = :cand_id AND jt.jtrng_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $pointsByCategory['training']['points'] = $result['training_points'] ?? 0;
    $pointsByCategory['training']['maxPoints'] = $result['max_training_points'] ?? 0;

    // Knowledge Points
    $sql = "SELECT SUM(DISTINCT jk.jknow_points) AS knowledge_points, 
            (SELECT SUM(jknow_points) FROM tbljobsknowledge WHERE jknow_jobId = :job_id) AS max_knowledge_points
            FROM tbljobsknowledge jk
            LEFT JOIN tblcandknowledge ck ON jk.jknow_knowledgeId = ck.canknow_knowledgeId
            WHERE ck.canknow_canId = :cand_id AND jk.jknow_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $pointsByCategory['knowledge']['points'] = $result['knowledge_points'] ?? 0;
    $pointsByCategory['knowledge']['maxPoints'] = $result['max_knowledge_points'] ?? 0;

    // Add points by category to returnValue
    $returnValue["pointsByCategory"] = $pointsByCategory;

    // Job Criteria and Candidate Matching
    $criteria = [];

    // Education: Check if the candidate's education meets the job criteria
    $sql = "SELECT DISTINCT c.course_categoryName, (CASE WHEN b.educ_coursesId IS NOT NULL THEN 1 ELSE 0 END) AS meets_criteria
            FROM tbljobseducation je
            INNER JOIN tblcoursescategory c ON je.jeduc_categoryId = c.course_categoryId
            LEFT JOIN tblcandeducbackground b ON b.educ_coursesId IN (
                SELECT courses_id
                FROM tblcourses
                WHERE courses_coursecategoryId = c.course_categoryId
            )
            AND b.educ_canId = :cand_id
            WHERE je.jeduc_jobId = :job_id
            GROUP BY c.course_categoryName";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $criteria["education"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    // Experience: Check if the candidate's experience meets the job criteria
    $sql = "SELECT DISTINCT jwe.jwork_responsibilities, 
              (CASE WHEN ceh.empH_positionName IS NOT NULL THEN 1 ELSE 0 END) AS meets_criteria
              FROM tbljobsworkexperience jwe
              LEFT JOIN tblcandemploymenthistory ceh ON jwe.jwork_responsibilities LIKE CONCAT('%', ceh.empH_positionName, '%')
                  AND ceh.empH_candId = :cand_id
              WHERE jwe.jwork_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $criteria["experience"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    // Skills: Check if the candidate's skills meet the job criteria
    $sql = "SELECT DISTINCT ps.perS_name, 
              (CASE WHEN cs.skills_perSId IS NOT NULL THEN 1 ELSE 0 END) AS meets_criteria
              FROM tbljobsskills js
              INNER JOIN tblpersonalskills ps ON js.jskills_skillsId = ps.perS_id
              LEFT JOIN tblcandskills cs ON cs.skills_perSId = ps.perS_id
                  AND cs.skills_candId = :cand_id
              WHERE js.jskills_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $criteria["skills"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    // Training: Check if the candidate's training meets the job criteria
    $sql = "SELECT DISTINCT pt.perT_name, 
              (CASE WHEN ct.training_perTId IS NOT NULL THEN 1 ELSE 0 END) AS meets_criteria
              FROM tbljobstrainings jt
              INNER JOIN tblpersonaltraining pt ON jt.jtrng_trainingId = pt.perT_id
              LEFT JOIN tblcandtraining ct ON ct.training_perTId = pt.perT_id
                  AND ct.training_candId = :cand_id
              WHERE jt.jtrng_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $criteria["training"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    // Knowledge: Check if the candidate's knowledge meets the job criteria
    $sql = "SELECT DISTINCT pk.knowledge_name, 
              (CASE WHEN ck.canknow_knowledgeId IS NOT NULL THEN 1 ELSE 0 END) AS meets_criteria
              FROM tbljobsknowledge jk
              INNER JOIN tblpersonalknowledge pk ON jk.jknow_knowledgeId = pk.knowledge_id
              LEFT JOIN tblcandknowledge ck ON ck.canknow_knowledgeId = pk.knowledge_id
                  AND ck.canknow_canId = :cand_id
              WHERE jk.jknow_jobId = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->bindParam(':job_id', $job_id);
    $stmt->execute();
    $criteria["knowledge"] = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

    // Add job criteria to returnValue
    $returnValue["criteria"] = $criteria;

    // Add education, employment, skills, training, and knowledge info
    $returnValue["educationalBackground"] = $this->fetchEducationalBackground($cand_id);
    $returnValue["employmentHistory"] = $this->fetchEmploymentHistory($cand_id);
    $returnValue["skills"] = $this->fetchSkills($cand_id);
    $returnValue["training"] = $this->fetchTraining($cand_id);
    $returnValue["knowledge"] = $this->fetchKnowledge($cand_id);

    // Return results
    return json_encode($returnValue);
  }

  function getJobInterviewDetails($data)
  {
    include "connection.php";
    $returnValue = [];
    $returnValue["interviewPassingPercent"] = $this->getInterviewPassingPercent($data['jobId']);
    $returnValue["interviewCriteria"] = $this->getInterviewCriteriaMaster($data);
    return $returnValue;
  }

  function getInterviewPassingPercent($jobId)
  {
    include "connection.php";
    $sql = "SELECT passing_percent FROM tblinterviewpassingpercent WHERE passing_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $jobId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getInterviewCategory()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblinterviewcategory WHERE interview_categ_status = 1";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function addInterviewCriteriaMaster($json)
  {
    // {"jobId": 11, "criteriaId": 8, "points": 200}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblinterviewcriteriamaster(inter_criteria_jobId, inter_criteria_criteriaId, inter_criteria_points)
            VALUES (:jobId, :criteriaId, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":criteriaId", $data['criteriaId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->execute();
    $lastId = $conn->lastInsertId();
    return $stmt->rowCount() > 0 ? $lastId : 0;
  }

  function deleteInterviewCriteria($json)
  {
    // {"criteriaId": 2}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblinterviewcriteriamaster SET inter_criteria_status = 0 WHERE inter_criteria_id = :criteriaId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":criteriaId", $data['criteriaId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function changeApplicantStatus($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $appId = $this->applicationIds($data['jobId'], $data['candId']);
    $date = $this->getCurrentDate();
    $id = json_encode($appId[0]['app_id']);
    $sql = "INSERT tblapplicationstatus(appS_appId, appS_statusId, appS_date) VALUES(:id, :status, :date)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":status", $data['status']);
    $stmt->bindParam(":id", $id);
    $stmt->bindParam(":date", $date);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function applicationIds($jobId, $candId)
  {
    include "connection.php";
    $sql = "SELECT app_id FROM tblapplications WHERE app_jobMId = :jobId AND app_candId = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->bindParam(":candId", $candId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function scoreInterviewApplicant($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblinterviewcandpoints(interviewP_jobId, interviewP_criteriaId, interviewP_candId, interviewP_points) VALUES(:jobId, :criteriaId, :candId, :points)";
    $stmt = $conn->prepare($sql);
    foreach ($data as $score) {
      $stmt->execute([
        ':jobId' => $score['jobId'],
        ':criteriaId' => $score['criteriaId'],
        ':candId' => $score['candId'],
        ':points' => $score['points'],
      ]);
    }
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getCriteriaAndCategory()
  {
    include "connection.php";
    $returnValue = [];
    $criteria = $this->getInterviewCriteria();
    $category = $this->getInterviewCategory();
    if (is_null($criteria) || is_null($category)) {
      return 0;
    }
    $returnValue['criteria'] = $criteria;
    $returnValue['category'] = $category;
    return json_encode($returnValue);
  }

  function getInterviewCriteria()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblinterviewcriteria";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getInterviewCriteriaMaster($json)
  {
    // {"jobId": 11}
    include "connection.php";
    $sql = "SELECT a.inter_criteria_id, b.criteria_inter_name, c.interview_categ_name, a.inter_criteria_points, b.criteria_inter_id FROM tblinterviewcriteriamaster a 
            INNER JOIN tblinterviewcriteria b ON b.criteria_inter_id = a.inter_criteria_criteriaId
            INNER JOIN tblinterviewcategory c ON c.interview_categ_id = b.criteria_inter_categId
            WHERE inter_criteria_jobId = :jobId AND a.inter_criteria_status = 1";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $json['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }
  function getCriteriaForInterview($json)
  {
    // {"jobId": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT a.inter_criteria_id, a.inter_criteria_points, b.criteria_inter_name, c.interview_categ_name FROM tblinterviewcriteriamaster a
            INNER JOIN tblinterviewcriteria b ON b.criteria_inter_id = a.inter_criteria_criteriaId
            INNER JOIN tblinterviewcategory c ON c.interview_categ_id = b.criteria_inter_categId
            WHERE inter_criteria_jobId = :jobId AND inter_criteria_status = 1
            ORDER BY b.criteria_inter_categId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getCandInterviewResult($json)
  {
    $returnValue = [];
    include "connection.php";
    $data = json_decode($json, true);

    // Fetch all active criteria for the job and left join with the candidate's points
    $sql = "SELECT COALESCE(a.interviewP_points, 0) AS CandPoints, b.inter_criteria_points AS CriteriaPoint, c.criteria_inter_name 
              FROM tblinterviewcriteriamaster b
              INNER JOIN tblinterviewcriteria c ON c.criteria_inter_id = b.inter_criteria_criteriaId
              LEFT JOIN tblinterviewcandpoints a ON a.interviewP_criteriaId = b.inter_criteria_id 
              AND a.interviewP_candId = :candId 
              WHERE b.inter_criteria_status = 1 AND b.inter_criteria_jobId = :jobId";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':candId', $data['candId']);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->execute();
    $returnValue["candCriteriaPoints"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

    // Calculate the total points
    $sql = "SELECT SUM(COALESCE(a.interviewP_points, 0)) as candTotalPoints, SUM(b.inter_criteria_points) as criteriaTotalPoints 
              FROM tblinterviewcriteriamaster b
              LEFT JOIN tblinterviewcandpoints a ON a.interviewP_criteriaId = b.inter_criteria_id 
              AND a.interviewP_candId = :candId 
              WHERE b.inter_criteria_status = 1 AND b.inter_criteria_jobId = :jobId";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':candId', $data['candId']);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->execute();

    $totalPoints = $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC) : 0;

    if ($totalPoints['criteriaTotalPoints'] === null) {
      return -1;
    } else {
      $returnValue["totalPoints"] = $totalPoints;
    }

    return json_encode($returnValue);
  }



  function updateJobPassingPercent($json)
  {
    // {"jobId": 11, "passingPercent": 80}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobpassing SET passing_points = :passingPercent WHERE passing_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->bindParam(':passingPercent', $data['passingPercent']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateInterviewPassingPercent($json)
  {
    // {"jobId": 11, "passingPercent": 80}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblinterviewpassingpercent SET passing_percent = :passingPercent WHERE passing_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->bindParam(':passingPercent', $data['passingPercent']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function addExam($json)
  {
    // {"master":{"name":"Sample Exam","typeId":2,"jobId":11,"duration":60},    
    // "questions":{"questionMaster":[{"text":"What is the capital of France?","typeId":1,"points":10,"options":[{"text":"Paris","isCorrect":1},{"text":"London","isCorrect":0},{"text":"Berlin","isCorrect":0},{"text":"Madrid","isCorrect":0}]},{"text":"What is 2 + 2?","typeId":1,"points":5,"options":[{"text":"3","isCorrect":0},{"text":"4","isCorrect":1},{"text":"5","isCorrect":0}]}]}}

    include "connection.php";
    $data = json_decode($json, true);
    $conn->beginTransaction();
    try {
      $master = $data['master'];
      $questions = $data['questions'];
      $todayDate = $this->getCurrentDate();
      $sql = "INSERT INTO tblexam(exam_name, exam_typeId, exam_jobMId, exam_duration, exam_createdAt, exam_updatedAt)
                  VALUES (:exam_name, :exam_typeId, :exam_jobId, :exam_duration, :exam_createdAt, :exam_updatedAt)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':exam_name', $master['name']);
      $stmt->bindParam(':exam_typeId', $master['typeId']);
      $stmt->bindParam(':exam_jobId', $master['jobId']);
      $stmt->bindParam(':exam_duration', $master['duration']);
      $stmt->bindParam(':exam_createdAt', $todayDate);
      $stmt->bindParam(':exam_updatedAt', $todayDate);
      $stmt->execute();
      $examId = $conn->lastInsertId();
      $sqlQuestion = "INSERT INTO tblexamquestion(examQ_examId, examQ_text, examQ_typeId, examQ_createdAt, examQ_updatedAt, examQ_points)
                          VALUES (:examQ_examId, :examQ_text, :examQ_typeId, :examQ_createdAt, :examQ_updatedAt, :examQ_points)";
      $stmtQuestion = $conn->prepare($sqlQuestion);
      $sqlOption = "INSERT INTO tblexamchoices(examC_questionId, examC_text, examC_isCorrect)
                        VALUES (:examC_questionId, :examC_text, :examC_isCorrect)";
      $stmtOption = $conn->prepare($sqlOption);
      foreach ($questions['questionMaster'] as $question) {
        $stmtQuestion->bindParam(':examQ_examId', $examId);
        $stmtQuestion->bindParam(':examQ_text', $question['text']);
        $stmtQuestion->bindParam(':examQ_typeId', $question['typeId']);
        $stmtQuestion->bindParam(':examQ_createdAt', $todayDate);
        $stmtQuestion->bindParam(':examQ_updatedAt', $todayDate);
        $stmtQuestion->bindParam(':examQ_points', $question['points']);
        $stmtQuestion->execute();
        $questionId = $conn->lastInsertId();
        foreach ($question['options'] as $option) {
          $stmtOption->bindParam(':examC_questionId', $questionId);
          $stmtOption->bindParam(':examC_text', $option['text']);
          $stmtOption->bindParam(':examC_isCorrect', $option['isCorrect']);
          $stmtOption->execute();
        }
      }

      $conn->commit();
      return 1;
    } catch (PDOException $e) {
      $conn->rollBack();
      return $e->getMessage();
    }
  }
  function getExam($jobId)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblexam WHERE exam_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $jobId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getExamDetails($jobId)
  {
    include "connection.php";
    $returnValue = [];
    $exam = $this->getExam($jobId);
    if ($exam !== 0) {
      $returnValue['examMaster'] = $exam;
      $returnValue['questionMaster'] = $this->getExamQuestions($exam[0]['exam_id']);
    } else {
      $returnValue = 0;
    }
    return $returnValue;
  }

  function getExamQuestions($examId)
  {
    $returnValue = [];
    include "connection.php";
    $sql = "SELECT * FROM tblexamquestion WHERE examQ_examId = :examId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':examId', $examId);
    $stmt->execute();
    $questions = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sqlOption = "SELECT * FROM tblexamchoices WHERE examC_questionId = :questionId";
    $stmtOption = $conn->prepare($sqlOption);

    foreach ($questions as &$question) {
      $stmtOption->bindParam(':questionId', $question['examQ_id']);
      $stmtOption->execute();
      $question['options'] = $stmtOption->fetchAll(PDO::FETCH_ASSOC);
    }

    $returnValue['questions'] = $questions;
    return $returnValue;
  }
} //admin

$json = isset($_POST["json"]) ? $_POST["json"] : "0";
$operation = isset($_POST["operation"]) ? $_POST["operation"] : "0";

$admin = new Admin();

switch ($operation) {
  case "addJobMaster":
    echo $admin->addJobMaster($json);
    break;
  case "getAllJobs":
    echo $admin->getAllJobs();
    break;
  case "getDropDownForAddJobs":
    echo $admin->getDropDownForAddJobs();
    break;
  case "getSelectedJobs":
    echo $admin->getSelectedJobs($json);
    break;
  case "getLookUpTables":
    echo $admin->getLookUpTables();
    break;
  case "handleJobStatusSwitch":
    echo $admin->handleJobStatusSwitch($json);
    break;
  case "getAllDataForDropdownUpdate":
    echo $admin->getAllDataForDropdownUpdate();
    break;
  case "getDuties":
    echo $admin->getDuties($json);
    break;
  case "addDuties":
    echo $admin->addDuties($json);
    break;
  case "updateDuties":
    echo $admin->updateDuties($json);
    break;
  case "deleteDuties":
    echo $admin->deleteDuties($json);
    break;
  case "getJobEducation":
    echo $admin->getJobEducation($json);
    break;
  case "addJobEducation":
    echo $admin->addJobEducation($json);
    break;
  case "updateJobEducation":
    echo $admin->updateJobEducation($json);
    break;
  case "deleteJobEducation":
    echo $admin->deleteJobEducation($json);
    break;
  case "getJobSkills":
    echo $admin->getJobSkills($json);
    break;
  case "updateJobSkills":
    echo $admin->updateJobSkills($json);
    break;
  case "addJobSkills":
    echo $admin->addJobSkills($json);
    break;
  case "deleteJobSkills":
    echo $admin->deleteJobSkills($json);
    break;
  case "getJobTraining":
    echo $admin->getJobTraining($json);
    break;
  case "addJobTraining":
    echo $admin->addJobTraining($json);
    break;
  case "updateJobTraining":
    echo $admin->updateJobTraining($json);
    break;
  case "deleteJobTraining":
    echo $admin->deleteJobTraining($json);
    break;
  case "getJobExperience":
    echo $admin->getJobExperience($json);
    break;
  case "addJobExperience":
    echo $admin->addJobExperience($json);
    break;
  case "updateJobExperience":
    echo $admin->updateJobExperience($json);
    break;
  case "deleteJobExperience":
    echo $admin->deleteJobExperience($json);
    break;
  case "getJobKnowledge":
    echo $admin->getJobKnowledge($json);
    break;
  case "addJobKnowledge":
    echo $admin->addJobKnowledge($json);
    break;
  case "updateJobKnowledge":
    echo $admin->updateJobKnowledge($json);
    break;
  case "deleteJobKnowledge":
    echo $admin->deleteJobKnowledge($json);
    break;
  case "getCandidateProfile":
    echo $admin->getCandidateProfile($json);
    break;
  case "getJobInterviewDetails":
    echo $admin->getJobInterviewDetails($json);
    break;
  case "deleteInterviewCriteria":
    echo $admin->deleteInterviewCriteria($json);
    break;
  case "changeApplicantStatus":
    echo $admin->changeApplicantStatus($json);
    break;
  case "scoreInterviewApplicant":
    echo $admin->scoreInterviewApplicant($json);
    break;
  case "getInterviewCategory":
    echo json_encode($admin->getInterviewCategory());
    break;
  case "addInterviewCriteriaMaster":
    echo $admin->addInterviewCriteriaMaster($json);
    break;
  case "getInterviewCriteriaMaster":
    echo json_encode($admin->getInterviewCriteriaMaster($json));
    break;
  case "getInterviewCriteria":
    echo json_encode($admin->getInterviewCriteria($json));
    break;
  case "getCriteriaAndCategory":
    echo $admin->getCriteriaAndCategory($json);
    break;
  case "getCriteriaForInterview":
    echo json_encode($admin->getCriteriaForInterview($json));
    break;
  case "getCandInterviewResult":
    echo $admin->getCandInterviewResult($json);
    break;
  case "updateJobPassingPercent":
    echo $admin->updateJobPassingPercent($json);
    break;
  case "updateInterviewPassingPercent":
    echo $admin->updateInterviewPassingPercent($json);
    break;
  case "addExam":
    echo $admin->addExam($json);
    break;
  case "getExamDetails":
    echo $admin->getExamDetails($json);
    break;
  default:
    echo "WALAY '" . $operation . "' NGA OPERATION SA UBOS HAHAHAHA BOBO";
    break;
}
