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

    $jobBranch = $data['jobBranch'];
    $jobMaster = $data['jobMaster'];
    $jobMasterDuties = $data['jobMasterDuties'];
    $jobEducation = $data['jobEducation'];
    $jobTraining = $data['jobTraining'];
    $jobSkills = $data['jobSkill'];
    $jobWorkExperience = $data['jobExperience'];
    $jobLicense = $data['jobLicense'];
    $todayDate = $this->getCurrentDate();

    try {
      $sql = "INSERT INTO tbljobsmaster (jobM_title, jobM_description, jobM_passpercentage, jobM_status, jobM_createdAt) VALUES (:jobM_title, :jobM_description, :jobM_passpercentage, :jobM_status, :jobM_createdAt)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobM_title", $jobMaster['title']);
      $stmt->bindParam(":jobM_description", $jobMaster['description']);
      $stmt->bindParam(":jobM_passpercentage", $jobMaster['passingPercentage']);
      $stmt->bindParam(":jobM_status", $jobMaster['isJobActive']);
      $stmt->bindParam(":jobM_createdAt", $todayDate);
      $stmt->execute();
      $jobMasterId = $conn->lastInsertId();

      $sql = "INSERT INTO tbljobpassing (passing_jobId, passing_points) VALUES (:passing_jobId, :passing_points)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":passing_jobId", $jobMasterId);
      $stmt->bindParam(":passing_points", $jobMaster['passingPercentage']);
      $stmt->execute();

      $sql = "INSERT INTO tbljobbranch (jobB_jobMId, jobB_branchId) VALUES (:jobId, :branchId)";
      foreach ($jobBranch as $jobBranch) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jobId", $jobMasterId);
        $stmt->bindParam(":branchId", $jobBranch['branchId']);
        $stmt->execute();
      }

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
      $sql = "INSERT INTO tbljobstrainings (jtrng_jobId, jtrng_text, jtrng_points) VALUES (:jtrng_jobId, :training, :points)";
      foreach ($jobTraining as $training) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jtrng_jobId", $jobMasterId);
        // $stmt->bindParam(":jtrng_text", $training['jobTraining']);
        $stmt->bindParam(":training", $training['training']);
        $stmt->bindParam(":points", $training['points']);
        $stmt->execute();
      }
      // jskills_text
      $sql = "INSERT INTO tbljobsskills (jskills_jobId, jskills_text, jskills_points) VALUES (:jskills_jobId, :skill, :points)";
      foreach ($jobSkills as $skill) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jskills_jobId", $jobMasterId);
        // $stmt->bindParam(":jskills_text", $skill['jobSkill']);
        $stmt->bindParam(":skill", $skill['skill']);
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

      // job license

      $sql = "INSERT INTO tbljobslicense (jlicense_licenceMId, jlicense_jobId, jlicense_points) VALUES (:jlicense_licenceMId, :jlicense_jobId, :jlicense_points)";
      foreach ($jobLicense as $license) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":jlicense_licenceMId", $license['licenseId']);
        $stmt->bindParam(":jlicense_jobId", $jobMasterId);
        $stmt->bindParam(":jlicense_points", $license['points']);
        $stmt->execute();
      }

      $sql = "INSERT INTO tblinterviewpassingpercent(passing_jobId, passing_percent) VALUES (:passing_jobId, 50)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":passing_jobId", $jobMasterId);
      $stmt->execute();

      $examName = "Untitled Exam";
      $examJobMId = $jobMasterId;

      $sql = "INSERT INTO tblexam(exam_name, exam_isActive, exam_typeId, exam_duration, exam_jobMId, exam_createdAt, exam_updatedAt)
              VALUES (:exam_name, 1, 2, 120, :exam_jobMId, :exam_createdAt, :exam_updatedAt)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":exam_name", $examName);
      $stmt->bindParam(":exam_jobMId", $examJobMId);
      $stmt->bindParam(":exam_createdAt", $todayDate);
      $stmt->bindParam(":exam_updatedAt", $todayDate);
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
    $sql = "SELECT a.*, COUNT(DISTINCT b.app_candId) as Total_Applied
              FROM tbljobsmaster a
              LEFT JOIN tblapplications b
              ON a.jobM_id = b.app_jobMId
              GROUP BY a.jobM_id
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
      $data['licenseMaster'] = $this->getLicenseMaster();
      $data['branch'] = $this->getBranch();
      $conn->commit();
      return json_encode($data);
    } catch (PDOException $th) {
      $conn->rollBack();
      return 0;
    }
  }


  function getJobDetails($json)
  {
    // {"jobId": 10}
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

    $sql = "SELECT * FROM tbljobstrainings
            WHERE jtrng_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobTrainings"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobsskills 
            WHERE jskills_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobSkills"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.*, b.license_master_name FROM tbljobslicense a 
            INNER JOIN tbllicensemaster b ON b.license_master_id = a.jlicense_licenceMId
            WHERE jlicense_jobId = :jobId
            ORDER BY license_master_name DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobLicenses"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tbljobsworkexperience WHERE jwork_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobExperience"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.*, b.branch_location FROM tbljobbranch a
            INNER JOIN tblbranch b ON b.branch_id = a.jobB_branchId
            WHERE jobB_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobBranch"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT passing_points as passing_percentage FROM tbljobpassing WHERE passing_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobPassing"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tblstatus";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["status"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    return json_encode($returnValue);
  }

  function getSelectedJobs($json)
  {
    include "connection.php";
    $returnValue = [];
    $totalPoints = 0;
    $data = json_decode($json, true);

    $sql = "SELECT * FROM tbljobsmaster WHERE jobM_id = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobMaster"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT jeduc_points FROM tbljobseducation WHERE jeduc_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $education = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($education as $educ) {
      $totalPoints += $educ['jeduc_points'];
    }
    $returnValue["jobEducation"] = $education;

    $sql = "SELECT jtrng_points FROM tbljobstrainings WHERE jtrng_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $trainings = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($trainings as $training) {
      $totalPoints += $training['jtrng_points'];
    }
    $returnValue["jobTrainings"] = $trainings;

    $sql = "SELECT jlicense_points FROM tbljobslicense WHERE jlicense_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $licenses = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($licenses as $license) {
      $totalPoints += $license['jlicense_points'];
    }
    $returnValue["jobLicenses"] = $licenses;

    // $sql = "SELECT jknow_points FROM tbljobsknowledge WHERE jknow_jobId = :jobId";
    // $stmt = $conn->prepare($sql);
    // $stmt->bindParam(":jobId", $data['jobId']);
    // $stmt->execute();
    // $knowledge = $stmt->fetchAll(PDO::FETCH_ASSOC);
    // foreach ($knowledge as $know) {
    //   $totalPoints += $know['jknow_points'];
    // }
    // $returnValue["jobKnowledge"] = $knowledge;

    $sql = "SELECT jskills_points FROM tbljobsskills WHERE jskills_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $skills = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($skills as $skill) {
      $totalPoints += $skill['jskills_points'];
    }
    $returnValue["jobSkills"] = $skills;

    $sql = "SELECT jwork_points FROM tbljobsworkexperience WHERE jwork_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $experience = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach ($experience as $exp) {
      $totalPoints += $exp['jwork_points'];
    }
    $returnValue["jobExperience"] = $experience;

    $sql = "SELECT passing_points as passing_percentage FROM tbljobpassing WHERE passing_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobPassing"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT * FROM tblstatus";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $returnValue["status"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT COUNT(*) FROM tblapplications WHERE app_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["hasCandidates"] = $stmt->rowCount() > 0 ? $stmt->fetchColumn() : 0;

    $sql = "SELECT b.cand_id, CONCAT(b.cand_lastname, ', ', b.cand_firstname, ' ', COALESCE(b.cand_middlename, '')) AS FullName, b.cand_email, e.status_name
              FROM tblapplications a
              INNER JOIN tblcandidates b ON a.app_candId = b.cand_id
              INNER JOIN tblapplicationstatus d ON d.appS_appId = a.app_id
              INNER JOIN tblstatus e ON e.status_id = d.appS_statusId
              WHERE a.app_jobMId = :jobId
              AND d.appS_id = (SELECT MAX(sub_d.appS_id)
              FROM tblapplicationstatus sub_d
              WHERE sub_d.appS_appId = d.appS_appId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["candidates"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $returnValue['exam'] = $this->getExam($data['jobId']);

    // foreach ($returnValue["candidates"] as &$candidate) {
    //   $candidate['points'] = $this->calculateCandidatePoints($candidate['cand_id'], $data['jobId']);
    // }

    $returnValue['jobTotalPoints'] = $totalPoints;
    // $returnValue['interviewPassing'] = $this->getInterviewPassingPercent($data['jobId']);

    return json_encode($returnValue);
  }

  public function calculateCandidatePotentialPoints($candId, $jobId)
  {
    include "connection.php";
    $totalPoints = 0;
    $maxPoints = 0;

    // Education Points
    $sql = "SELECT SUM(c.jeduc_points) as educ_points,
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

    // Calculate percentage
    $percentage = ($maxPoints > 0) ? round(($totalPoints / $maxPoints) * 100, 2) : 0;

    return [
      'maxPoints' => $maxPoints,
      'Points' => $totalPoints,
      'percentage' => $percentage,
    ];
  }


  public function calculateCandidatePoints($candId, $jobId)
  {
    include "connection.php";
    $totalPoints = 0;
    $maxPoints = 0;

    // Education Points
    $sql = "SELECT SUM(c.jeduc_points) as educ_points,
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
    $sql = "SELECT SUM(a.jwork_points) AS exp_points,
    (SELECT SUM(jwork_points) FROM tbljobsworkexperience WHERE jwork_jobId = :jobId) AS max_exp_points
      FROM tbljobsworkexperience a
      INNER JOIN tblcandemploymenthistory c
        ON a.jwork_jobId = :jobId
        AND (
          a.jwork_responsibilities LIKE CONCAT('%', c.empH_positionName, '%')
          OR a.jwork_responsibilities IS NULL
        )
      WHERE c.empH_candId = :candId
        AND TIMESTAMPDIFF(YEAR, c.empH_startDate, IFNULL(c.empH_endDate, CURDATE())) >= a.jwork_duration";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $experiencePoints = $result['exp_points'] ?? 0;
    $maxExperiencePoints = $result['max_exp_points'] ?? 0;
    $totalPoints += $experiencePoints;
    $maxPoints += $maxExperiencePoints;

    // echo "experience points" . $experiencePoints;
    // die();

    // Skills Points
    $sql = "SELECT SUM(j.jskills_points) as skills_points,
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
    $sql = "SELECT SUM(j.jtrng_points) as training_points,
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
    $sql = "SELECT SUM(j.jknow_points) as knowledge_points,
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

    // echo "Candidate ID: $candId, Job ID: $jobId\n";
    // echo "Education Points: $educationPoints, Max: $maxEducationPoints\n";
    // echo "Experience Points: $experiencePoints, Max: $maxExperiencePoints\n";
    // echo "Skills Points: $skillsPoints, Max: $maxSkillsPoints\n";
    // echo "Training Points: $trainingPoints, Max: $maxTrainingPoints\n";
    // echo "Knowledge Points: $knowledgePoints, Max: $maxKnowledgePoints\n";
    // die();


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
      $data['courseCategory'] = $this->getCourseCategory();
      $data['license'] = $this->getLicenseMaster();
      $data['branch'] = $this->getBranch();
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
    $sql = "SELECT a.*, b.course_categoryName FROM tbljobseducation a 
            INNER JOIN tblcoursescategory b ON a.jeduc_categoryId = b.course_categoryId
            WHERE jeduc_jobId = :jobId";
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
    $sql = "UPDATE tbljobsskills SET jskills_text = :skill, jskills_points = :points WHERE jskills_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":skill", $data['skill']);
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
    $sql = "INSERT INTO tbljobsskills (jskills_jobId, jskills_text, jskills_points)
            VALUES (:jobId, :skill, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":skill", $data['skill']);
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
    $sql = "INSERT INTO tbljobstrainings (jtrng_jobId, jtrng_text, jtrng_points)
            VALUES (:jobId, :training, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":training", $data['training']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateJobTraining($json)
  {
    // {"id": 10, "trainingId": 3, "points": 10}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobstrainings SET jtrng_text = :training, jtrng_points = :points WHERE jtrng_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":training", $data['training']);
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
    $sql = "SELECT * FROM tblcandskills WHERE skills_candId = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $cand_id);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
  }

  function fetchTraining($cand_id)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcandtraining WHERE training_candId = :cand_id";
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

  public function getCandidateProfile($json)
  {
    // {"appId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $appId = $data['appId'];

    $sql = "SELECT app_candId, app_jobMId FROM tblapplications WHERE app_id = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':appId', $appId);
    $stmt->execute();
    $applicationData = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];

    $candId = $applicationData['app_candId'];
    $jobId = $applicationData['app_jobMId'];

    $sql = "SELECT * FROM tblcandidates WHERE cand_id = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId);
    $stmt->execute();
    $candidateInformation = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];

    $sql = "SELECT 
            c.course_categoryName, 
            IFNULL(a.candEduc_points, 0) AS candEduc_points, 
            IFNULL(b.jeduc_points, 0) AS jeduc_points 
          FROM tblcandeducpoints a 
          INNER JOIN tbljobseducation b ON b.jeduc_id = a.candEduc_educId
          INNER JOIN tblcoursescategory c ON c.course_categoryId = b.jeduc_categoryId
          WHERE a.candEduc_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':appId', $appId);
    $stmt->execute();
    $education = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT 
            b.jwork_responsibilities, 
            IFNULL(a.candEmp_points, 0) AS candEmp_points, 
            IFNULL(b.jwork_points, 0) AS jwork_points 
          FROM tblcandemppoints a 
          INNER JOIN tbljobsworkexperience b ON b.jwork_id = a.candEmp_jworkId
          WHERE candEmp_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':appId', $appId);
    $stmt->execute();
    $experience = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT 
            b.jskills_text, 
            IFNULL(a.candSkill_points, 0) AS candSkill_points, 
            IFNULL(b.jskills_points, 0) AS jskills_points 
          FROM tblcandskillpoints a
          INNER JOIN tbljobsskills b ON b.jskills_id = a.candSkill_jobSkillsId
          WHERE candSkill_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':appId', $appId);
    $stmt->execute();
    $skills = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT 
            b.jtrng_text, 
            IFNULL(a.candTrain_points, 0) AS candTrain_points, 
            IFNULL(b.jtrng_points, 0) AS jtrng_points 
          FROM tblcandtrainpoints a 
          INNER JOIN tbljobstrainings b ON b.jtrng_id = a.candTrain_trngId
          WHERE candTrain_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':appId', $appId);
    $stmt->execute();
    $training = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT COUNT(`joboffer_id`) AS isJobOffered 
          FROM tbljoboffer 
          WHERE `joboffer_candId` = :cand_id AND `joboffer_jobMId` = :job_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId);
    $stmt->bindParam(':job_id', $jobId);
    $stmt->execute();
    $isJobOffered = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];

    $sql = "SELECT COUNT(medicalM_id) as isMedicalChecked 
          FROM tblmedicalmaster 
          WHERE `medicalM_candId` = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId);
    $stmt->execute();
    $isMedicalChecked = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];

    $medicalClassification = $this->getCandMedClassification($candId);
    $candEducationalBackground = $this->fetchEducationalBackground($candId);
    $candEmploymentHistory = $this->fetchEmploymentHistory($candId);
    $candSkills = $this->fetchSkills($candId);
    $candTraining = $this->fetchTraining($candId);
    $candLicenses = $this->fetchLicenses($candId);

    $qualifications = [
      "education" => $education,
      "experience" => $experience,
      "skills" => $skills,
      "training" => $training
    ];

    $returnValue = [
      "medicalClassification" => $medicalClassification,
      "medicalChecked" => $isMedicalChecked["isMedicalChecked"],
      "jobOffered" => $isJobOffered["isJobOffered"],
      "candidateInformation" => $candidateInformation,
      "qualifications" => $qualifications,
      "educationalBackground" => $candEducationalBackground,
      "employmentHistory" => $candEmploymentHistory,
      "licenses" => $candLicenses,
      "skills" => $candSkills,
      "training" => $candTraining
    ];

    return json_encode($returnValue);
  }

  function getPotentialCandidateProfile($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $candId = $data['candId'];

    $sql = "SELECT * FROM tblcandidates WHERE cand_id = :cand_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cand_id', $candId);
    $stmt->execute();
    $candidateInformation = $stmt->fetch(PDO::FETCH_ASSOC) ?: [];
    $medicalClassification = $this->getCandMedClassification($candId);
    $candEducationalBackground = $this->fetchEducationalBackground($candId);
    $candEmploymentHistory = $this->fetchEmploymentHistory($candId);
    $candSkills = $this->fetchSkills($candId);
    $candTraining = $this->fetchTraining($candId);
    $candLicenses = $this->fetchLicenses($candId);

    $returnValue = [
      "candidateInformation" => $candidateInformation,
      "educationalBackground" => $candEducationalBackground,
      "employmentHistory" => $candEmploymentHistory,
      "licenses" => $candLicenses,
      "skills" => $candSkills,
      "training" => $candTraining
    ];

    return json_encode($returnValue);
  }


  function fetchLicenses($cand_id)
  {
    // {"candId": 1}
    include "connection.php";
    $sql = "SELECT a.license_master_name, b.license_type_name, c.license_number FROM tbllicensemaster a
            INNER JOIN tbllicensetype b ON b.license_type_id = a.license_master_typeId
            INNER JOIN tblcandlicense c ON c.license_masterId = a.license_master_id
            WHERE c.license_canId = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':candId', $cand_id);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getJobInterviewDetails($json)
  {
    // {"jobId": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $returnValue = [];
    $returnValue["interviewPassingPercent"] = $this->getInterviewPassingPercent($data['jobId']);
    $interviewCriteria = $this->getInterviewCriteriaMaster($data);
    if ($interviewCriteria === 0) {
      return 0;
    }
    $returnValue["interviewCriteria"] = $interviewCriteria;
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
    $sql = "SELECT * FROM tblinterviewcategory";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function addInterviewCategory($json)
  {
    // {"categoryName": "Sample Category"}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblinterviewcategory(interview_categ_name) VALUES(:categoryName)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":categoryName", $data['interviewCategoryName']);
    $stmt->execute();
    $lastId = $conn->lastInsertId();
    return $stmt->rowCount() > 0 ? $lastId : 0;
  }

  function deleteInterviewCategory($json)
  {
    // {"categoryId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblinterviewcategory WHERE interview_categ_id = :categoryId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":categoryId", $data['interviewCategoryId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        return -1;
      }
      throw $e;
    }
  }

  function updateInterviewCategory($json)
  {
    // {"categoryId": 1, "categoryName": "Updated Category"}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblinterviewcategory SET interview_categ_name = :categoryName WHERE interview_categ_id = :categoryId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":categoryId", $data['interviewCategoryId']);
    $stmt->bindParam(":categoryName", $data['interviewCategoryName']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function addInterviewCriteriaMaster($json)
  {
    // {"jobId": 11, "criteriaId": 8, "points": 200}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblinterviewcriteriamaster(inter_criteria_jobId, inter_criteria_criteriaId, inter_criteria_question, inter_criteria_points)
            VALUES (:jobId, :criteriaId, :question, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":criteriaId", $data['criteriaId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":question", $data['question']);
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
    // $sql = "DELETE FROM tblinterviewcriteriamaster WHERE inter_criteria_id = :criteriaId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":criteriaId", $data['criteriaId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function changeApplicantStatus($json)
  {
    // {"jobId": 12, "candId": 12, "status": 4, "hrId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $appId = $this->applicationIds($data['jobId'], $data['candId']);
    $id = json_encode($appId[0]['app_id']);
    $date = $this->getCurrentDate();
    $sql = "INSERT tblapplicationstatus(appS_appId, appS_statusId, appS_date, appS_hrId) VALUES(:id, :status, :date, :hrId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":status", $data['status']);
    $stmt->bindParam(":id", $id);
    $stmt->bindParam(":date", $date);
    $stmt->bindParam(":hrId", $data["hrId"]);
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
    // {"masterData":{"jobId":25,"candId":41,"status":1,"percentageScore":100,"score":10,"totalScore":10},"scoreData":[{"jobId":25,"criteriaId":82,"candId":41,"points":10}]}

    include "connection.php";
    include "send_email.php";
    $data = json_decode($json, true);
    $masterData = $data['masterData'];
    $scoreData = $data['scoreData'];
    $conn->beginTransaction();
    $sendEmail = new SendEmail();
    try {
      $sql = "INSERT INTO tblinterviewcandpoints(interviewP_jobId, interviewP_criteriaId, interviewP_candId, interviewP_points)
              VALUES(:jobId, :criteriaId, :candId, :points)";
      $stmt = $conn->prepare($sql);
      foreach ($scoreData as $score) {
        $stmt->execute([
          ':jobId' => $score['jobId'],
          ':criteriaId' => $score['criteriaId'],
          ':candId' => $score['candId'],
          ':points' => $score['points']
        ]);
      }

      $sql = "INSERT INTO tblinterviewresult(interviewR_jobId, interviewR_candId, interviewR_score, interviewR_totalScore, interviewR_status, interviewR_date)
              VALUES(:jobId, :candId, :score, :totalPoints, :status, NOW())";
      $stmt = $conn->prepare($sql);
      $stmt->execute([
        ':jobId' => $masterData['jobId'],
        ':candId' => $masterData['candId'],
        ':score' => $masterData['score'],
        ':totalPoints' => $masterData['totalScore'],
        ':status' => $masterData['status']
      ]);
      // Get exam schedule date
      $sql = "SELECT exam_scheduleDate FROM tblexam WHERE exam_jobMId = :jobId AND exam_isActive = 1";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $masterData['jobId']);
      $stmt->execute();
      $examDate = $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC)["exam_scheduleDate"] : 0;

      // Get candidate email
      $sql = "SELECT cand_email FROM tblcandidates WHERE cand_id = :candId";
      $stmt2 = $conn->prepare($sql);
      $stmt2->bindParam(":candId", $masterData['candId']);
      $stmt2->execute();
      $email = $stmt2->rowCount() > 0 ? $stmt2->fetch(PDO::FETCH_ASSOC)["cand_email"] : [];

      // Get job title
      $sql = "SELECT jobM_title FROM tbljobsmaster WHERE jobM_id = :jobId";
      $stmt3 = $conn->prepare($sql);
      $stmt3->bindParam(":jobId", $masterData['jobId']);
      $stmt3->execute();
      $jobTitle = $stmt3->rowCount() > 0 ? $stmt3->fetch(PDO::FETCH_ASSOC)["jobM_title"] : "Unknown Position";
      // URL encode the job title for the exam link
      $encodedJobTitle = rawurlencode($jobTitle);
      $examLink = "http://localhost:3000/candidatesDashboard/exam/" . $encodedJobTitle;

      if ($examDate != 0) {
        $emailSubject = "🎯 Exam Scheduled - " . $jobTitle;
        $emailBody = '
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Exam Notification</title>
            <style>
                body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }
                .container { max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); }
                .header { background: linear-gradient(135deg, #1e5631 0%, #2d5a3d 100%); color: white; padding: 30px; text-align: center; }
                .header h1 { margin: 0; font-size: 28px; font-weight: 600; }
                .content { padding: 40px 30px; }
                .job-title { background-color: #1e5631; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2d5a3d; }
                .job-title h2 { margin: 0; color: white; font-size: 22px; }
                .exam-info { background-color: #1e5631; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2d5a3d; }
                .exam-info h3 { margin: 0 0 10px 0; color: white; font-size: 18px; }
                .exam-date { font-size: 16px; color: white; font-weight: 500; }
                .cta-button { display: inline-block; background: linear-gradient(135deg, #1e5631 0%, #2d5a3d 100%); color: white; padding: 15px 30px; text-decoration: none; border-radius: 25px; font-weight: 600; font-size: 16px; margin: 20px 0; transition: transform 0.2s; }
                .cta-button:hover { transform: translateY(-2px); }
                .footer { background-color: #f0f8f0; padding: 20px; text-align: center; color: #1e5631; font-size: 14px; }
                .divider { height: 1px; background-color: #e9ecef; margin: 30px 0; }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="header">
                    <h1>🎯 Exam Notification</h1>
                </div>
                <div class="content">
                    <p style="font-size: 16px; color: #333; margin-bottom: 20px;">Congratulations! Your interview has been completed and your exam has been scheduled.</p>
                    
                    <div class="job-title">
                        <h2>📋 Position: ' . htmlspecialchars($jobTitle) . '</h2>
                    </div>
                    
                    <div class="exam-info">
                        <h3>📅 Exam Schedule</h3>
                        <div class="exam-date">Date: ' . date("F j, Y \a\\t g:i A", strtotime($examDate)) . '</div>
                    </div>
                    
                    <div style="text-align: center; margin: 30px 0;">
                        <a href="' . $examLink . '" class="cta-button" style="color: white;">🚀 Take Your Exam</a>
                    </div>
                    
                    <div class="divider"></div>
                    
                    <p style="font-size: 14px; color: #666; line-height: 1.6;">
                        <strong>Important Notes:</strong><br>
                        • Please ensure you have a stable internet connection<br>
                        • Complete the exam within the scheduled time<br>
                        • Contact our support team if you encounter any issues
                    </p>
                </div>
                <div class="footer">
                    <p>Good luck with your exam!<br>Del Monte Foods Inc.</p>
                </div>
            </div>
        </body>
        </html>';
        $sendEmail->sendEmail($email, $emailSubject, $emailBody);
      } else {
        $emailSubject = "⏳ Exam Pending - " . $jobTitle;
        $emailBody = '
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Exam Update</title>
            <style>
                body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; }
                .container { max-width: 600px; margin: 0 auto; background-color: #ffffff; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); }
                .header { background: linear-gradient(135deg, #1e5631 0%, #2d5a3d 100%); color: white; padding: 30px; text-align: center; }
                .header h1 { margin: 0; font-size: 28px; font-weight: 600; }
                .content { padding: 40px 30px; }
                .job-title { background-color: #1e5631; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2d5a3d; }
                .job-title h2 { margin: 0; color: white; font-size: 22px; }
                .pending-info { background-color: #1e5631; padding: 20px; border-radius: 8px; margin: 20px 0; border-left: 4px solid #2d5a3d; }
                .pending-info h3 { margin: 0 0 10px 0; color: white; font-size: 18px; }
                .pending-text { font-size: 16px; color: white; }
                .footer { background-color: #f0f8f0; padding: 20px; text-align: center; color: #1e5631; font-size: 14px; }
                .divider { height: 1px; background-color: #e9ecef; margin: 30px 0; }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="header">
                    <h1>⏳ Exam Update</h1>
                </div>
                <div class="content">
                    <p style="font-size: 16px; color: #333; margin-bottom: 20px;">Thank you for completing your interview. We are currently processing your application.</p>
                    
                    <div class="job-title">
                        <h2>📋 Position: ' . htmlspecialchars($jobTitle) . '</h2>
                    </div>
                    
                    <div class="pending-info">
                        <h3>📅 Exam Status</h3>
                        <div class="pending-text">Your exam is not yet scheduled. Please wait for further notification with the scheduled date and time.</div>
                    </div>
                    
                    <div class="divider"></div>
                    
                    <p style="font-size: 14px; color: #666; line-height: 1.6;">
                        <strong>What happens next?</strong><br>
                        • We will review your interview results<br>
                        • You will receive an email with your exam schedule<br>
                        • Please check your email regularly for updates
                    </p>
                </div>
                <div class="footer">
                    <p>Thank you for your patience!<br>Del Monte Foods Inc.</p>
                </div>
            </div>
        </body>
        </html>';
        $sendEmail->sendEmail($email, $emailSubject, $emailBody);
      }
      $conn->commit();
      return 1;
    } catch (PDOException $e) {
      $conn->rollBack();
      return $e->getMessage();
    }
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
    $sql = "SELECT a.inter_criteria_id, a.inter_criteria_question, b.criteria_inter_name, c.interview_categ_name, a.inter_criteria_points, b.criteria_inter_id FROM tblinterviewcriteriamaster a
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
    $sql = "SELECT a.inter_criteria_id, a.inter_criteria_points, a.inter_criteria_question, b.criteria_inter_name, c.interview_categ_name FROM tblinterviewcriteriamaster a
            INNER JOIN tblinterviewcriteria b ON b.criteria_inter_id = a.inter_criteria_criteriaId
            INNER JOIN tblinterviewcategory c ON c.interview_categ_id = b.criteria_inter_categId
            WHERE inter_criteria_jobId = :jobId AND inter_criteria_status = 1
            ORDER BY b.criteria_inter_categId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->execute();

    $passingPoints = $this->getInterviewPassingPercent($data['jobId']);

    $returnValue = [];
    $returnValue['criteria'] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    $returnValue['passingPoints'] = $passingPoints;

    return $returnValue;
  }

  function getCandInterviewResult($json)
  {
    // {"jobId": 16, "candId": 11}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tblinterviewresult WHERE interviewR_jobId = :jobId AND interviewR_candId = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->bindParam(':candId', $data['candId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function updateJobPassingPercent($json)
  {
    // {"jobId": 11, "passingPercent": 80}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobsmaster SET jobM_passpercentage = :passingPercent WHERE jobM_id = :jobId";
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
      return $examId;
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

  function getSpecificExam($examId)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblexam WHERE exam_id  = :exam_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':exam_id', $examId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }


  function getExamDetails($json)
  {
    include "connection.php";
    $returnValue = [];
    $data = json_decode($json, true);
    $examId = $data['examId'];
    $exam = $this->getSpecificExam($examId);
    if ($exam !== 0) {
      $returnValue['examMaster'] = $exam;
      $returnValue['questionMaster'] = $this->getExamQuestions($examId);
      $returnValue['passingPercentage'] = $this->getExamPassingPercentage($exam[0]['exam_jobMId']);
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

  function addExamQuestions($json)
  {
    // {"examId": 1, "questions": [{"text":"What is the capital of France?","typeId":1,"points":10,"options":[{"text":"Paris","isCorrect":1},{"text":"London","isCorrect":0},{"text":"Berlin","isCorrect":0},{"text":"Madrid","isCorrect":0}]},{"text":"What is 2 + 2?","typeId":1,"points":5,"options":[{"text":"3","isCorrect":0},{"text":"4","isCorrect":1},{"text":"5","isCorrect":0}]}]}
    include "connection.php";
    $conn->beginTransaction();
    try {
      $data = json_decode($json, true);
      $currentDate = $this->getCurrentDate();
      $sql = "INSERT INTO tblexamquestion(examQ_examId, examQ_text, examQ_typeId, examQ_createdAt, examQ_updatedAt, examQ_points)
            VALUES (:examQ_examId, :examQ_text, :examQ_typeId, :examQ_createdAt, :examQ_updatedAt, :examQ_points)";
      $sqlOption = "INSERT INTO tblexamchoices(examC_questionId, examC_text, examC_isCorrect)
                  VALUES (:examC_questionId, :examC_text, :examC_isCorrect)";
      foreach ($data['questions'] as $question) {
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':examQ_examId', $data['examId']);
        $stmt->bindParam(':examQ_text', $question['text']);
        $stmt->bindParam(':examQ_typeId', $question['typeId']);
        $stmt->bindParam(':examQ_createdAt', $currentDate);
        $stmt->bindParam(':examQ_updatedAt', $currentDate);
        $stmt->bindParam(':examQ_points', $question['points']);
        $stmt->execute();
        $questionId = $conn->lastInsertId();
        if (isset($question['options']) && is_array($question['options'])) {
          $stmtOption = $conn->prepare($sqlOption);
          foreach ($question['options'] as $option) {
            $stmtOption->bindParam(':examC_questionId', $questionId);
            $stmtOption->bindParam(':examC_text', $option['text']);
            $isCorrect = $option['isCorrect'];
            $stmtOption->bindParam(':examC_isCorrect', $isCorrect);
            $stmtOption->execute();
          }
        }
      }
      $conn->commit();
      return 1;
    } catch (\Throwable $th) {
      $conn->rollBack();
      return $th;
    }
  }

  function updateExamQuestion($json)
  {
    // {"questionId": 6, "text": "What is the capital of Francessss?", "typeId": 1, "points": 10, "options": [{"text": "Parisssss", "isCorrect": 1}, {"text": "Londonssss", "isCorrect": 0}, {"text": "Berlinsssss", "isCorrect": 0}, {"text": "Madriddddd", "isCorrect": 0}]}
    include "connection.php";
    $conn->beginTransaction();
    try {
      $data = json_decode($json, true);
      $currentDate = $this->getCurrentDate();

      // Check if question has any candidate answers
      $sqlCheck = "SELECT COUNT(*) FROM tblexamcandidateanswer a
                  INNER JOIN tblexamchoices b ON a.examcandA_choiceId = b.examC_id
                  WHERE b.examC_questionId = :questionId";
      $stmtCheck = $conn->prepare($sqlCheck);
      $stmtCheck->bindParam(':questionId', $data['questionId']);
      $stmtCheck->execute();
      if ($stmtCheck->fetchColumn() > 0) {
        $conn->rollBack();
        return -1;
      }

      $sqlUpdateQuestion = "UPDATE tblexamquestion SET examQ_text = :examQ_text, examQ_typeId = :examQ_typeId,
                            examQ_updatedAt = :examQ_updatedAt, examQ_points = :examQ_points WHERE examQ_id = :examQ_id";
      $stmtUpdateQuestion = $conn->prepare($sqlUpdateQuestion);
      $stmtUpdateQuestion->bindParam(':examQ_text', $data['text']);
      $stmtUpdateQuestion->bindParam(':examQ_typeId', $data['typeId']);
      $stmtUpdateQuestion->bindParam(':examQ_updatedAt', $currentDate);
      $stmtUpdateQuestion->bindParam(':examQ_points', $data['points']);
      $stmtUpdateQuestion->bindParam(':examQ_id', $data['questionId']);
      $stmtUpdateQuestion->execute();

      $sqlDeleteOptions = "DELETE FROM tblexamchoices WHERE examC_questionId = :examQ_id";
      $stmtDeleteOptions = $conn->prepare($sqlDeleteOptions);
      $stmtDeleteOptions->bindParam(':examQ_id', $data['questionId']);
      $stmtDeleteOptions->execute();

      if (isset($data['options']) && is_array($data['options'])) {
        $sqlInsertOption = "INSERT INTO tblexamchoices(examC_questionId, examC_text, examC_isCorrect)
                            VALUES (:examC_questionId, :examC_text, :examC_isCorrect)";
        $stmtInsertOption = $conn->prepare($sqlInsertOption);
        foreach ($data['options'] as $option) {
          $stmtInsertOption->bindParam(':examC_questionId', $data['questionId']);
          $stmtInsertOption->bindParam(':examC_text', $option['text']);
          $isCorrect = $option['isCorrect'];
          $stmtInsertOption->bindParam(':examC_isCorrect', $isCorrect);
          $stmtInsertOption->execute();
        }
      }

      $conn->commit();
      return 1;
    } catch (\Throwable $th) {
      $conn->rollBack();
      return 0;
    }
  }

  function updateExamMaster($json)
  {
    // {"examId": 2, "name": "Sample Exam", "duration": 60}
    include "connection.php";
    $data = json_decode($json, true);
    $dateNow = $this->getCurrentDate();
    $conn->beginTransaction();
    try {
      $sql = "UPDATE tblexam SET exam_name = :exam_name, exam_duration = :exam_duration, exam_updatedAt = :exam_updatedAt WHERE exam_id = :exam_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':exam_id', $data['examId']);
      $stmt->bindParam(':exam_name', $data['name']);
      $stmt->bindParam(':exam_duration', $data['duration']);
      $stmt->bindParam(':exam_updatedAt', $dateNow);
      $stmt->execute();

      $sql = "UPDATE tbljobsmaster set jobM_passpercentage = :passingPercent where jobM_id = :jobM_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':passingPercent', $data['passingPercent']);
      $stmt->bindParam(':jobM_id', $data['jobId']);
      $stmt->execute();

      $conn->commit();
      return 1;
    } catch (\Throwable $th) {
      $conn->rollBack();
      return -1;
    }
  }

  function getCourseCategory()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcoursescategory";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getCourse()
  {
    include "connection.php";
    $sql = "SELECT a.courses_id, b.course_categoryId, c.crs_type_id, a.courses_name, b.course_categoryName, c.crs_type_name FROM tblcourses a
            INNER JOIN tblcoursescategory b ON b.course_categoryId = a.courses_coursecategoryId
            INNER JOIN tblcoursetype c ON c.crs_type_id = a.courses_courseTypeId
            ORDER BY a.courses_name";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getInstitution()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblinstitution";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getKnowledge()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblpersonalknowledge";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getLicenseMaster()
  {
    include "connection.php";
    $sql = "SELECT a.license_master_id, b.license_type_id, a.license_master_name, b.license_type_name FROM tbllicensemaster a
            INNER JOIN tbllicensetype b ON b.license_type_id = a.license_master_typeId
            ORDER BY a.license_master_name";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getLicenseType()
  {
    include "connection.php";
    $sql = "SELECT * FROM tbllicensetype";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getSkills()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblpersonalskills";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getTraining()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblpersonaltraining";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getCourseType()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcoursetype";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getAddCourseDropdown()
  {
    include "connection.php";
    $returnValue = [];
    $returnValue['courseCategory'] = $this->getCourseCategory();
    $returnValue['courseType'] = $this->getCourseType();
    return json_encode($returnValue);
  }

  function addCourseCategory($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblcoursescategory(course_categoryName) VALUES (:course_categoryName)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':course_categoryName', $data["courseCategoryName"]);
    $stmt->execute();
    $newId = $conn->lastInsertId();
    return $stmt->rowCount() > 0 ? $newId : 0;
  }

  function addCourse($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblcourses(courses_coursecategoryId, courses_courseTypeId, courses_name) VALUES (:courses_coursecategoryId, :courses_courseTypeId, :courses_name)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':courses_coursecategoryId', $data['courseCategory']);
    $stmt->bindParam(':courses_courseTypeId', $data['courseType']);
    $stmt->bindParam(':courses_name', $data['courseName']);
    $stmt->execute();
    $newId = $conn->lastInsertId();
    return $stmt->rowCount() > 0 ? $newId : 0;
  }

  function addInstitution($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblinstitution(institution_name) VALUES (:institution_name)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':institution_name', $data['institutionName']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $conn->lastInsertId() : 0;
  }

  function addKnowledge($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblpersonalknowledge(knowledge_name) VALUES (:knowledge_name)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':knowledge_name', $data['knowledgeName']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $conn->lastInsertId() : 0;
  }

  function addLicenseMaster($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbllicensemaster(license_master_name, license_master_typeId) VALUES (:license_master_name, :license_master_typeId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':license_master_name', $data['licenseName']);
    $stmt->bindParam(':license_master_typeId', $data['licenseType']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $conn->lastInsertId() : 0;
  }

  function addLicenseType($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbllicensetype(license_type_name) VALUES (:license_type_name)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':license_type_name', $data['licenseTypeName']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $conn->lastInsertId() : 0;
  }

  function addSkills($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblpersonalskills(perS_name) VALUES (:skills_name)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':skills_name', $data['skillName']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $conn->lastInsertId() : 0;
  }

  function addTraining($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblpersonaltraining(perT_name) VALUES (:perT_name)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':perT_name', $data['trainingName']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $conn->lastInsertId() : 0;
  }

  function updateCourseCategory($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblcoursescategory SET course_categoryName = :course_categoryName WHERE course_categoryId = :course_categoryId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':course_categoryName', $data['courseCategoryName']);
    $stmt->bindParam(':course_categoryId', $data['courseCategoryId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateCourse($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblcourses SET courses_coursecategoryId = :courses_coursecategoryId, courses_courseTypeId = :courses_courseTypeId, courses_name = :courses_name WHERE courses_id = :courses_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':courses_coursecategoryId', $data['courseCategory']);
    $stmt->bindParam(':courses_courseTypeId', $data['courseType']);
    $stmt->bindParam(':courses_name', $data['courseName']);
    $stmt->bindParam(':courses_id', $data['courseId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateInstitution($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblinstitution SET institution_name = :institution_name WHERE institution_id = :institution_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':institution_name', $data['institutionName']);
    $stmt->bindParam(':institution_id', $data['institutionId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateKnowledge($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblpersonalknowledge SET knowledge_name = :knowledge_name WHERE knowledge_id = :knowledge_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':knowledge_name', $data['knowledgeName']);
    $stmt->bindParam(':knowledge_id', $data['knowledgeId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateLicenseMaster($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbllicensemaster SET license_master_name = :license_master_name, license_master_typeId = :license_master_typeId WHERE license_master_id = :license_master_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':license_master_name', $data['licenseName']);
    $stmt->bindParam(':license_master_typeId', $data['licenseType']);
    $stmt->bindParam(':license_master_id', $data['licenseId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateLicenseType($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbllicensetype SET license_type_name = :license_type_name WHERE license_type_id = :license_type_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':license_type_name', $data['licenseTypeName']);
    $stmt->bindParam(':license_type_id', $data['licenseTypeId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateSkill($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblpersonalskills SET perS_name = :perS_name WHERE perS_id = :perS_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':perS_name', $data['skillName']);
    $stmt->bindParam(':perS_id', $data['skillId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateTraining($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblpersonaltraining SET perT_name = :perT_name, perT_percentage = :perT_percentage WHERE perT_id = :perT_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':perT_name', $data['trainingName']);
    $stmt->bindParam(':perT_id', $data['trainingId']);
    $stmt->bindParam(':perT_percentage', $data['percentage']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteCourseCategory($json)
  {
    // {"courseCategoryId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblcoursescategory WHERE course_categoryId = :course_categoryId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':course_categoryId', $data['courseCategoryId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      // throw 0;
    }
  }

  function deleteCourse($json)
  {
    // {"courseId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblcourses WHERE courses_id = :courses_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':courses_id', $data['courseId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function deleteInstitution($json)
  {
    // {"institutionId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblinstitution WHERE institution_id = :institution_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':institution_id', $data['institutionId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function deleteKnowledge($json)
  {
    // {"knowledgeId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblpersonalknowledge WHERE knowledge_id = :knowledge_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':knowledge_id', $data['knowledgeId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function deleteLicenseMaster($json)
  {
    // {"licenseMasterId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tbllicensemaster WHERE license_master_id = :license_master_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':license_master_id', $data['licenseId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function deleteLicenseType($json)
  {
    // {"licenseTypeId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tbllicensetype WHERE license_type_id = :license_type_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':license_type_id', $data['licenseTypeId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function deleteSkill($json)
  {
    // {"skillId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblpersonalskills WHERE perS_id = :perS_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':perS_id', $data['skillId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function deleteTraining($json)
  {
    // {"trainingId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblpersonaltraining WHERE perT_id = :perT_id";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':perT_id', $data['trainingId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }


  function getGeneralExam()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblexam WHERE exam_typeId  = 1";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getGeneralExamDetails()
  {
    include "connection.php";
    $returnValue = [];
    $exam = $this->getGeneralExam();
    if ($exam !== 0) {
      $returnValue['examMaster'] = $exam;
      $returnValue['questionMaster'] = $this->getExamQuestions($exam[0]['exam_id']);
    } else {
      $returnValue = 0;
    }
    return $returnValue;
  }

  function getCandidateExamPoints($json)
  {
    // {"candidateId": 7, "jobId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tblexamresult WHERE examR_candId = :candidateId AND examR_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':candidateId', $data['candidateId']);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function sendJobOffer($json)
  {
    // {"candId": 7, "jobId": 11, "statusId": 1, "salary": 10000, "document": "document", "expiryDate": "2024-01-01"}
    include "connection.php";
    $data = json_decode($json, true);
    $date = $this->getCurrentDate();
    $sql = "INSERT INTO tbljoboffer(joboffer_candId, joboffer_jobMId, joboffer_date, joboffer_salary, joboffer_document, joboffer_expiryDate)
            VALUES (:joboffer_candId, :joboffer_jobMId, :joboffer_date, :joboffer_salary, :joboffer_document, :joboffer_expiryDate)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':joboffer_candId', $data['candId']);
    $stmt->bindParam(':joboffer_jobMId', $data['jobId']);
    $stmt->bindParam(':joboffer_date', $date);
    $stmt->bindParam(':joboffer_salary', $data['salary']);
    $stmt->bindParam(':joboffer_document', $data['document']);
    $stmt->bindParam(':joboffer_expiryDate', $data['expiryDate']);
    $stmt->execute();

    $lastId = $conn->lastInsertId();
    $sql = "INSERT INTO tblstatusjoboffer(statusjobO_jobofferId, statusjobO_statusId, statusjobO_date) VALUES (:joboffer_id, 3, :date)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':joboffer_id', $lastId);
    $stmt->bindParam(':date', $date);
    $stmt->execute();

    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getInterviewCandidates($json)
  {
    // {"jobId": 25}
    include "connection.php";
    $data = json_decode($json, true);

    $sql = "SELECT b.app_id, c.cand_id, CONCAT(c.cand_lastname, ', ', c.cand_firstname, ' ', COALESCE(c.cand_middlename, '')) AS fullName,
                    c.cand_email, d.status_name, DATE_FORMAT(e.latest_sched_date, '%b %d, %Y') AS schedDate,
                    DATE_FORMAT(e.latest_sched_date, '%l:%i %p') AS schedTime
              FROM tblapplicationstatus a
              INNER JOIN tblapplications b ON b.app_id = a.appS_appId
              INNER JOIN tblcandidates c ON c.cand_id = b.app_candId
              INNER JOIN tblstatus d ON d.status_id = a.appS_statusId
              INNER JOIN (SELECT intsched_jobId, intsched_candId, MAX(intsched_date) AS latest_sched_date FROM tblinterviewschedule GROUP BY intsched_jobId, intsched_candId) e
                    ON e.intsched_jobId = b.app_jobMId AND e.intsched_candId = c.cand_id
              INNER JOIN (SELECT appS_appId, MAX(appS_id) AS latest_appS_id FROM tblapplicationstatus GROUP BY appS_appId) latest_status
                    ON latest_status.latest_appS_id = a.appS_id
              WHERE a.appS_statusId = 6 AND b.app_jobMId = :jobId ORDER BY e.latest_sched_date";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getExamCandidates($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT b.app_id, c.cand_id, CONCAT(c.cand_lastname, ', ', c.cand_firstname, ' ', COALESCE(c.cand_middlename, '')) AS fullName, d.status_name
            FROM tblapplicationstatus a
            INNER JOIN tblapplications b ON b.app_id = a.appS_appId
            INNER JOIN tblcandidates c ON c.cand_id = b.app_candId
            INNER JOIN tblstatus d ON d.status_id = a.appS_statusId
            WHERE a.appS_id = (SELECT MAX(sub.appS_id) FROM tblapplicationstatus sub WHERE sub.appS_appId = a.appS_appId)
            AND (a.appS_statusId = 5 OR a.appS_statusId = 9 OR a.appS_statusId = 10)
            AND b.app_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function updateJobMaster($json)
  {
    // {"jobId": 2, "jobTitle": "Job Title", "jobDescription": "Job Description"}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobsmaster SET jobM_title = :jobM_title, jobM_description = :jobM_description WHERE jobM_id = :jobM_id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobM_title', $data['jobTitle']);
    $stmt->bindParam(':jobM_description', $data['jobDescription']);
    $stmt->bindParam(':jobM_id', $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function batchSetInterview($json)
  {
    include "connection.php";
    include "send_email.php";
    $conn->beginTransaction();
    try {
      $data = json_decode($json, true);
      $candidates = $data['candidates'];
      $dateNow = $this->getCurrentDate();
      $date = $data['date'];
      $jobId = $data['jobId'];
      $sendEmail = new SendEmail();

      $sql2 = "INSERT INTO tblinterviewschedule (intsched_jobId, intsched_candId, intsched_date)
        VALUES (:intsched_jobId, :intsched_candId, :intsched_date)";
      $stmt2 = $conn->prepare($sql2);
      $stmt = $conn->prepare("INSERT INTO tblapplicationstatus (appS_appId, appS_statusId, appS_date, appS_hrId)
      VALUES (:appS_appId, 6, :appS_date, :appS_hrId)");
      foreach ($candidates as $candidate) {
        $appId = $this->applicationIds($jobId, $candidate['candId']);
        $id = json_encode($appId[0]['app_id']);

        $stmt2->bindParam(':intsched_jobId', $jobId);
        $stmt2->bindParam(':intsched_candId', $candidate['candId']);
        $stmt2->bindParam(':intsched_date', $date);
        $stmt2->execute();

        $formattedDate = date('F j, Y g:iA', strtotime($date));
        $emailSubject = "You have been selected for an interview";
        $emailBody = "Hello " . $candidate['fullName'] . "! You have been selected for an interview.
        <br><br> The interview date is: " . $formattedDate;
        $sendEmail->sendEmail($candidate['candEmail'], $emailSubject, $emailBody);

        $stmt->bindParam(':appS_appId', $id);
        $stmt->bindParam(':appS_date', $dateNow);
        $stmt->bindParam(':appS_hrId', $data["hrId"]);
        $stmt->execute();
      }

      $conn->commit();
      return 1;
    } catch (\Throwable $th) {
      $conn->rollBack();
      return $th;
    }
  }

  function getPendingCandidates($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $candidates = [];

    // Fetch candidates
    $sql = "SELECT 
                b.cand_id, 
                CONCAT(b.cand_lastname, ', ', b.cand_firstname, ' ', COALESCE(b.cand_middlename, '')) AS FullName,
                b.cand_email, 
                e.status_name,
                DATE_FORMAT(d.appS_date, '%b %d, %Y') as Date
            FROM tblapplications a
            INNER JOIN tblcandidates b ON a.app_candId = b.cand_id
            INNER JOIN tblapplicationstatus d ON d.appS_appId = a.app_id
            INNER JOIN tblstatus e ON e.status_id = d.appS_statusId
            WHERE a.app_jobMId = :jobId
            AND d.appS_id = (
                SELECT MAX(sub_d.appS_id) 
                FROM tblapplicationstatus sub_d 
                WHERE sub_d.appS_appId = d.appS_appId
            )
            AND d.appS_statusId IN (1, 2, 12)
            ORDER BY b.cand_id DESC";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $candidates = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($candidates)) {
      return [];
    }

    foreach ($candidates as &$candidate) {
      $sql = "SELECT b.course_categoryName FROM tblcourses a
              INNER JOIN tblcoursescategory b ON a.courses_coursecategoryId = b.course_categoryId
              INNER JOIN tblcandeducbackground c ON c.educ_coursesId = a.courses_id
              WHERE c.educ_canId = :candId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":candId", $candidate['cand_id']);
      $stmt->execute();
      $candidate['courses'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT a.perS_name 
                FROM tblpersonalskills a
                INNER JOIN tblcandskills b ON b.skills_perSId = a.perS_id
                WHERE b.skills_candId = :candId";

      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":candId", $candidate['cand_id']);
      $stmt->execute();

      $candidate['skills'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT a.perT_name 
                FROM tblpersonaltraining a
                INNER JOIN tblcandtraining b ON b.training_perTId = a.perT_id
                WHERE b.training_candId = :candId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":candId", $candidate['cand_id']);
      $stmt->execute();
      $candidate['trainings'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT a.knowledge_name
                FROM tblpersonalknowledge a
                INNER JOIN tblcandknowledge b ON b.canknow_knowledgeId = a.knowledge_id
                WHERE b.canknow_canId = :candId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":candId", $candidate['cand_id']);
      $stmt->execute();
      $candidate['knowledge'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

      $sql = "SELECT a.empH_positionName FROM tblcandemploymenthistory a
              WHERE a.empH_candId = :candId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":candId", $candidate['cand_id']);
      $stmt->execute();
      $candidate['employmentHistory'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // foreach ($candidates as &$candidate) {
    //   $points = $this->calculateCandidatePoints($candidate['cand_id'], $data['jobId']);
    //   $candidate['maxPoints'] = $points['maxPoints'];
    //   $candidate['totalPoints'] = $points['totalPoints'];
    //   $candidate['percentage'] = $points['percentage'];
    // }

    // usort($candidates, function ($a, $b) {
    //   return $b['percentage'] <=> $a['percentage'];
    // });

    return $candidates;
  }



  function getJobPassingPercentage($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT jobM_passpercentage as passing_percentage FROM tbljobsmaster WHERE jobM_id = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC)["passing_percentage"] : 0;
  }

  function getPendingDetails($json)
  {
    // {"jobId": 1}
    $returnValue = [];
    $returnValue['candidates'] = $this->getPendingCandidates($json);
    $returnValue['passingPercentage'] = $this->getJobPassingPercentage($json);
    return $returnValue;
  }

  function getBackgroundCheckCandidates($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT b.app_id, c.cand_id, CONCAT(c.cand_lastname, ', ', c.cand_firstname, ' ', COALESCE(c.cand_middlename, '')) AS fullName, d.status_name
            FROM tblapplicationstatus a
            INNER JOIN tblapplications b ON b.app_id = a.appS_appId
            INNER JOIN tblcandidates c ON c.cand_id = b.app_candId
            INNER JOIN tblstatus d ON d.status_id = a.appS_statusId
            WHERE a.appS_id = (SELECT MAX(sub.appS_id) FROM tblapplicationstatus sub WHERE sub.appS_appId = a.appS_appId)
            AND (a.appS_statusId = 7) AND b.app_jobMId = :jobId
            ORDER BY c.cand_id DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getJobOfferCandidates($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT b.app_id, c.cand_id, CONCAT(c.cand_lastname, ', ', c.cand_firstname, ' ', COALESCE(c.cand_middlename, '')) AS fullName,
            g.jobofferS_name as jobOfferStatus, e.joboffer_salary, e.joboffer_document,
            DATE_FORMAT(e.joboffer_date, '%b %d, %Y') as joboffer_date, joboffer_expiryDate
            FROM tblapplicationstatus a
            INNER JOIN tblapplications b ON b.app_id = a.appS_appId
            INNER JOIN tblcandidates c ON c.cand_id = b.app_candId
            INNER JOIN tblstatus d ON d.status_id = a.appS_statusId
            INNER JOIN tbljoboffer e ON e.joboffer_jobMId = b.app_jobMId AND e.joboffer_candId = c.cand_id
            INNER JOIN tblstatusjoboffer f on f.statusjobO_jobofferId = e.joboffer_id
            INNER JOIN tbljobofferstatus g ON g.jobofferS_id = f.statusjobO_statusId
            WHERE a.appS_id = (SELECT MAX(sub.appS_id) FROM tblapplicationstatus sub WHERE sub.appS_appId = a.appS_appId)
            AND (a.appS_statusId = 8 OR a.appS_statusId = 4)
            AND b.app_jobMId = :jobId
            AND f.statusjobO_id = (
              SELECT MAX(sub.statusjobO_id)
              FROM tblstatusjoboffer sub
              WHERE sub.statusjobO_jobofferId = e.joboffer_id
            )";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getExamPassingPercentage($jobId)
  {
    include "connection.php";
    $sql = "SELECT jobM_passpercentage FROM tbljobsmaster WHERE jobM_id = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC) : 0;
  }

  function addInterviewCriteria($json)
  {
    // {"criteriaName": "Criteria Name", "categoryId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblinterviewcriteria (criteria_inter_name, criteria_inter_categId) VALUES (:criteriaName, :categoryId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":criteriaName", $data['interviewCriteriaName']);
    $stmt->bindParam(":categoryId", $data['interviewCategoryId']);
    $stmt->execute();
    $lastId = $conn->lastInsertId();
    return $stmt->rowCount() > 0 ? $lastId : 0;
  }

  function getInterviewCriteriaMasterFiles()
  {
    include "connection.php";
    $sql = "SELECT a.criteria_inter_id, a.criteria_inter_name, b.interview_categ_id, b.interview_categ_name FROM tblinterviewcriteria a
            INNER JOIN tblinterviewcategory b ON a.criteria_inter_categId = b.interview_categ_id";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function deleteInterviewCriteriaMaster($json)
  {
    // {"criteriaId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblinterviewcriteria WHERE criteria_inter_id = :criteriaId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":criteriaId", $data['criteriaId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function updateInterviewCriteria($json)
  {
    // {"criteriaId": 1, "criteriaName": "Updated Criteria Name", "categoryId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblinterviewcriteria SET criteria_inter_name = :criteriaName, criteria_inter_categId = :categoryId WHERE criteria_inter_id = :criteriaId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":criteriaId", $data['criteriaId']);
    $stmt->bindParam(":criteriaName", $data['interviewCriteriaName']);
    $stmt->bindParam(":categoryId", $data['interviewCategoryId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getDecisionPendingCandidates($json)
  {
    include "connection.php";
    $candidates = [];
    $decisionPendingCand = [];
    $data = json_decode($json, true);

    $sql = "SELECT b.app_id, c.cand_id, CONCAT(c.cand_lastname, ', ', c.cand_firstname, ' ', COALESCE(c.cand_middlename, '')) AS fullName, d.status_name, c.cand_email
            FROM tblapplicationstatus a
            INNER JOIN tblapplications b ON b.app_id = a.appS_appId
            INNER JOIN tblcandidates c ON c.cand_id = b.app_candId
            INNER JOIN tblstatus d ON d.status_id = a.appS_statusId
            WHERE a.appS_id = (SELECT MAX(sub.appS_id) FROM tblapplicationstatus sub WHERE sub.appS_appId = a.appS_appId)
            AND (a.appS_statusId = 13)
            AND b.app_jobMId = :jobId";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $candidates = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($candidates as $cand) {
      $candId = $cand['cand_id'];
      $fullName = $cand['fullName'];
      $email = $cand['cand_email'];

      // candidate + job qualification points
      $candJobPoints = $this->getAllCandidateQualificationPoints($cand["app_id"]);
      $totalJobPoints = $this->getAllJobQualificationPoints($data['jobId']);

      // --- INTERVIEW ---
      $sql = "SELECT interviewR_score, interviewR_totalScore 
                FROM tblinterviewresult 
                WHERE interviewR_jobId = :jobId AND interviewR_candId = :candId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->bindParam(":candId", $candId);
      $stmt->execute();
      $interview = $stmt->fetch(PDO::FETCH_ASSOC);

      if ($interview) {
        $interviewScore = $interview['interviewR_score'];
        $interviewTotalScore = $interview['interviewR_totalScore'];
      } else {
        $interviewScore = 0;
        $interviewTotalScore = 0;
      }

      // --- EXAM ---
      $sql = "SELECT examR_score, examR_totalScore 
                FROM tblexamresult 
                WHERE examR_jobMId = :jobId AND examR_candId = :candId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->bindParam(":candId", $candId);
      $stmt->execute();
      $exam = $stmt->fetch(PDO::FETCH_ASSOC);

      if ($exam) {
        $examScore = $exam['examR_score'];
        $examTotalScore = $exam['examR_totalScore'];
      } else {
        $examScore = 0;
        $examTotalScore = 0;
      }

      // --- CALCULATIONS ---
      $overallJobPoints = $totalJobPoints + $interviewTotalScore + $examTotalScore;
      $candOverAllPoints = $candJobPoints + $interviewScore + $examScore;

      // avoid division by zero
      if ($overallJobPoints > 0) {
        $overallPointsPercent = ($candOverAllPoints / $overallJobPoints) * 100;
      } else {
        $overallPointsPercent = 0;
      }

      $decisionPendingCand[] = [
        "appId" => $cand["app_id"],
        "candId" => $candId,
        "fullName" => $fullName,
        "email" => $email,
        "candOverAllPoints" => $candOverAllPoints . "/" . $overallJobPoints,
        "overallPointsPercent" => number_format($overallPointsPercent, 2) . "%",
      ];
    }

    return count($decisionPendingCand) > 0 ? $decisionPendingCand : 0;
  }


  function getEmployedCandidates($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT b.app_id, c.cand_id, CONCAT(c.cand_lastname, ', ', c.cand_firstname, ' ', COALESCE(c.cand_middlename, '')) AS fullName, d.status_name
            FROM tblapplicationstatus a
            INNER JOIN tblapplications b ON b.app_id = a.appS_appId
            INNER JOIN tblcandidates c ON c.cand_id = b.app_candId
            INNER JOIN tblstatus d ON d.status_id = a.appS_statusId
            WHERE a.appS_id = (SELECT MAX(sub.appS_id) FROM tblapplicationstatus sub WHERE sub.appS_appId = a.appS_appId)
            AND (a.appS_statusId = 11)
            AND b.app_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function updateJobOffer($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljoboffer SET joboffer_salary = :salary, joboffer_document = :document, joboffer_expiryDate = :expiryDate WHERE joboffer_candId = :candidateId AND joboffer_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candidateId", $data['candidateId']);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":salary", $data['salary']);
    $stmt->bindParam(":document", $data['document']);
    $stmt->bindParam(":expiryDate", $data['expiryDate']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobOffer($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    try {
      // Start a transaction
      $conn->beginTransaction();

      // Delete child records first
      $sqlChild = "DELETE FROM tblstatusjoboffer WHERE statusjobO_jobofferId =
                      (SELECT joboffer_id FROM tbljoboffer WHERE joboffer_candId = :candId AND joboffer_jobMId = :jobId)";
      $stmtChild = $conn->prepare($sqlChild);
      $stmtChild->bindParam(":candId", $data['candId']);
      $stmtChild->bindParam(":jobId", $data['jobId']);
      $stmtChild->execute();

      // Delete parent record
      $sqlParent = "DELETE FROM tbljoboffer WHERE joboffer_candId = :candId AND joboffer_jobMId = :jobId";
      $stmtParent = $conn->prepare($sqlParent);
      $stmtParent->bindParam(":candId", $data['candId']);
      $stmtParent->bindParam(":jobId", $data['jobId']);
      $stmtParent->execute();

      // Commit the transaction
      $conn->commit();

      return $stmtParent->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      $conn->rollBack(); // Roll back on failure
      if ($e->getCode() == '23000') {
        return $e;
      }
      throw $e;
    }
  }

  function getReappliedCandidates($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = 'SELECT a.app_id, c.cand_id, CONCAT(c.cand_lastname, ", ", c.cand_firstname, " ", COALESCE(c.cand_middlename, "")) AS fullName,
            DATE_FORMAT(b.appS_date, "%b %d, %Y %l:%i %p") as appS_date,
            (SELECT s.status_name
            FROM tblapplicationstatus ast
            INNER JOIN tblstatus s ON s.status_id = ast.appS_statusId
            WHERE ast.appS_appId = a.app_id
            ORDER BY ast.appS_id DESC
            LIMIT 1) as status
            FROM tblapplications a
            INNER JOIN tblapplicationstatus b ON b.appS_appId = a.app_id
            INNER JOIN tblcandidates c ON c.cand_id = a.app_candId
            WHERE a.app_jobMId = :jobId AND b.appS_statusId = 14';
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getPotentialCandidates($json)
  {
    // {"jobId": 19}
    include "connection.php";
    $data = json_decode($json, true);
    $jobId = $data['jobId'];
    $returnValue = [];

    // Fetch raw candidates
    // - Has uploaded a resume
    // - Not employed
    // - Not already applied to this job
    // - Active in last 6 months (applied to any job)
    $sql = "
        SELECT DISTINCT c.cand_id, c.cand_lastname, c.cand_firstname, c.cand_middlename, c.cand_email
        FROM tblcandidates c
        INNER JOIN tblcandresume cr ON cr.canres_candId = c.cand_id
        WHERE c.cand_isEmployed = 0
          AND NOT EXISTS (
              SELECT 1 
              FROM tblapplications a 
              WHERE a.app_candId = c.cand_id AND a.app_jobMId = :jobId
          )
          AND (
            EXISTS (
                SELECT 1 
                FROM tblapplications a2 
                WHERE a2.app_candId = c.cand_id 
                  AND a2.app_datetime >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
            )
            OR NOT EXISTS (SELECT 1 FROM tblapplications a3 WHERE a3.app_candId = c.cand_id)
          )
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId, PDO::PARAM_INT);
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $formattedCandidates = [];
    foreach ($results as $candidate) {
      $candId = $candidate['cand_id'];
      $fullName = $candidate['cand_lastname'] . ", " . $candidate['cand_firstname'] . " " . $candidate['cand_middlename'];
      $email = $candidate['cand_email'];

      // ✅ keep your existing helper
      $candQualifications = $this->getCandidateQualifications($candId);

      $formattedCandidates[] = [
        'candId' => $candId,
        'fullName' => $fullName,
        'email' => $email,
        'candQualifications' => $candQualifications
      ];
    }

    // ✅ keep your existing helper
    $jobQualifications = $this->getJobQualifications($jobId);

    $returnValue = [
      "jobQualifications" => $jobQualifications,
      "candidates" => $formattedCandidates
    ];

    return !empty($returnValue["candidates"]) ? $returnValue : 0;
  }


  // function getPotentialCandidates($json)
  // {
  //   // {"jobId": 1, "passingPercentage": 50}
  //   include "connection.php";
  //   $data = json_decode($json, true);

  //   $jobId = $data['jobId'];
  //   $passingPercentage = $data['passingPercentage'];
  //   // Fetch candidates where cand_isApplied = 0
  //   $sql = "SELECT cand_id, cand_lastname, cand_firstname, cand_middlename, cand_email
  //           FROM tblcandidates c
  //           WHERE c.cand_isEmployed = 0
  //             AND NOT EXISTS (
  //                 SELECT 1
  //                 FROM tblapplications a
  //                 WHERE a.app_candId = c.cand_id
  //                   AND a.app_jobMId = :jobId
  //             );
  //           ";
  //   $stmt = $conn->prepare($sql);
  //   $stmt->bindParam(":jobId", $jobId);
  //   $stmt->execute();
  //   $candidates = $stmt->fetchAll(PDO::FETCH_ASSOC);
  //   $fitCandidates = [];
  //   foreach ($candidates as $candidate) {
  //     $candId = $candidate['cand_id'];
  //     $fullName = $candidate['cand_lastname'] . ", " . $candidate['cand_firstname'] . " " . $candidate['cand_middlename'];
  //     $email = $candidate['cand_email'];
  //     // Calculate points for each candidate
  //     $points = $this->calculateCandidatePotentialPoints($candId, $jobId);
  //     echo json_encode($points);
  //     die();
  //     // Check if candidate fits the job
  //     if ($points['percentage'] >= $passingPercentage) {
  //       $fitCandidates[] = [
  //         'candId' => $candId,
  //         'fullName' => $fullName,
  //         'email' => $email,
  //         'maxPoints' => $points['maxPoints'],
  //         'totalPoints' => $points['totalPoints'],
  //         'percentage' => $points['percentage'],
  //       ];
  //     }
  //   }
  //   return !empty($fitCandidates) ? $fitCandidates : 0;
  // }

  function getCandidateEducations($candId)
  {
    include "connection.php";
    $sql = "SELECT a.*, b.courses_name, c.course_categoryName FROM tblcandeducbackground a
            INNER JOIN tblcourses b ON b.courses_id = a.educ_coursesId
            INNER JOIN tblcoursescategory c ON c.course_categoryId = b.courses_coursecategoryId
            WHERE educ_canId = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getCandidateSkills($candId)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcandskills WHERE skills_candId = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getCandidateTrainings($candId)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcandtraining WHERE training_candId = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getCandidateExperiences($candId)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcandemploymenthistory WHERE empH_candId = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getCandidateLicenses($candId)
  {
    include "connection.php";
    $sql = "SELECT * FROM tblcandlicense WHERE license_canId  = :candId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $candId);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getCandidateQualifications($candId)
  {
    include "connection.php";
    $candQualifications = [];
    $educations = $this->getCandidateEducations($candId);
    $skills = $this->getCandidateSkills($candId);
    $trainings = $this->getCandidateTrainings($candId);
    $employments = $this->getCandidateExperiences($candId);
    $license = $this->getCandidateLicenses($candId);

    $candQualifications = [
      'educations' => $educations,
      'skills' => $skills,
      'trainings' => $trainings,
      'employments' => $employments,
      'licenses' => $license
    ];
    return $candQualifications ? $candQualifications : 0;
  }

  function getJobQualifications($jobId)
  {
    include "connection.php";
    $jobQualifications = [];
    $educations = $this->getJobEducation(json_encode(["jobId" => $jobId]));
    $skills = $this->getJobSkills(json_encode(["jobId" => $jobId]));
    $trainings = $this->getJobTraining(json_encode(["jobId" => $jobId]));
    $employments = $this->getJobExperience(json_encode(["jobId" => $jobId]));
    $license = $this->getJobLicense(json_encode(["jobId" => $jobId]));

    $jobQualifications = [
      'educations' => is_string($educations) ? json_decode($educations, true) : $educations,
      'skills' => is_string($skills) ? json_decode($skills, true) : $skills,
      'trainings' => is_string($trainings) ? json_decode($trainings, true) : $trainings,
      'employments' => is_string($employments) ? json_decode($employments, true) : $employments,
      'licenses' => is_string($license) ? json_decode($license, true) : $license
    ];


    return $jobQualifications ? $jobQualifications : 0;
  }

  function sendPotentialCandidateEmail($json)
  {
    include "connection.php";
    include "send_email.php";

    $data = json_decode($json, true);
    $jobName = $data['master']['jobTitle'];
    $sendEmail = new SendEmail();
    try {
      foreach ($data['candidates'] as $candidate) {
        $emailSubject = "Delmonte Job Offer: $jobName";
        $emailBody = "Dear " . $candidate['fullName'] . "! You are qualified for the '$jobName' at Delmonte, and we would like to invite you to apply.
      Please visit our website for more information.";
        $sendEmail->sendEmail($candidate['candEmail'], $emailSubject, $emailBody);
      }
      return 1;
    } catch (\Throwable $th) {
      return 0;
    }
  }

  function getAllJobWithCandidates()
  {
    include "connection.php";
    $sql = "SELECT a.jobM_title, a.jobM_id, a.jobM_createdAt, COUNT(DISTINCT b.app_candId) as Total_Applied
              FROM tbljobsmaster a
              LEFT JOIN tblapplications b
              ON a.jobM_id = b.app_jobMId
              GROUP BY a.jobM_id
              ORDER BY Total_Applied DESC";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : 0;
  }

  function getMedicalCandidate($json)
  {
    // {"jobId": 1}
    include "connection.php";
    $data = json_decode($json, true);

    $sql = "SELECT b.app_id, c.cand_id, CONCAT(c.cand_lastname, ', ', c.cand_firstname, ' ', COALESCE(c.cand_middlename, '')) AS fullName,
                    c.cand_email, d.status_name, DATE_FORMAT(e.latest_sched_date, '%b %d, %Y') AS schedDate,
                    DATE_FORMAT(e.latest_sched_date, '%l:%i %p') AS schedTime
              FROM tblapplicationstatus a
              INNER JOIN tblapplications b ON b.app_id = a.appS_appId
              INNER JOIN tblcandidates c ON c.cand_id = b.app_candId
              INNER JOIN tblstatus d ON d.status_id = a.appS_statusId
              INNER JOIN (SELECT intsched_jobId, intsched_candId, MAX(intsched_date) AS latest_sched_date FROM tblinterviewschedule GROUP BY intsched_jobId, intsched_candId) e
                    ON e.intsched_jobId = b.app_jobMId AND e.intsched_candId = c.cand_id
              INNER JOIN (SELECT appS_appId, MAX(appS_id) AS latest_appS_id FROM tblapplicationstatus GROUP BY appS_appId) latest_status
                    ON latest_status.latest_appS_id = a.appS_id
              WHERE a.appS_statusId = 17 AND b.app_jobMId = :jobId ORDER BY e.latest_sched_date";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':jobId', $data['jobId']);

    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getMedicalClassification()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblmedicalclassification";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function addMedicalMaster($json)
  {
    // {"candId": 1, "medicalCId": 1, "hrId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $date = $this->getCurrentDate();
    $sql = "INSERT INTO tblmedicalmaster(medicalM_candId, medicalM_medicalCId, medicalM_dateTime, medicalM_hrId, medicalM_jobMid)
            VALUES (:candId, :medicalCId, :dateTime, :hrId, :jobMid)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':candId', $data['candId']);
    $stmt->bindParam(':medicalCId', $data['medicalCId']);
    $stmt->bindParam(':dateTime', $date);
    $stmt->bindParam(':hrId', $data['hrId']);
    $stmt->bindParam(':jobMid', $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getAdminActivityLogs()
  {
    include "connection.php";
    $sql = 'SELECT d.app_id, CONCAT(b.hr_lastname, ", ", b.hr_firstname, " ", COALESCE(b.hr_middlename, "")) AS HRName, c.status_name, e.jobM_title, e.jobM_id, f.cand_id, 
            CONCAT(f.cand_lastname, ", ", f.cand_firstname, " ", COALESCE(f.cand_middlename, "")) AS CandName, a.appS_date FROM tblapplicationstatus a
            LEFT JOIN tblhr b ON a.appS_hrId = b.hr_id
            INNER JOIN tblstatus c ON a.appS_statusId = c.status_id
            INNER JOIN tblapplications d ON d.app_id = a.appS_appId
            INNER JOIN tbljobsmaster e ON e.jobM_id = d.app_jobMId
            INNER JOIN tblcandidates f ON f.cand_id = d.app_candId
            ORDER BY a.appS_date DESC';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getInterviewSchedule()
  {
    include "connection.php";
    $sql = 'SELECT d.app_id, a.intsched_date, b.jobM_title, b.jobM_id, c.cand_id, CONCAT(c.cand_lastname, ", ", c.cand_firstname, " ", COALESCE(c.cand_middlename, "")) AS FullName 
            FROM tblinterviewschedule a
            INNER JOIN tbljobsmaster b ON b.jobM_id = a.intsched_jobId
            INNER JOIN tblcandidates c ON c.cand_id = a.intsched_candId
            INNER JOIN tblapplications d ON d.app_jobMId = b.jobM_id AND d.app_candId = c.cand_id
            WHERE a.intsched_date >= CURDATE() 
            AND NOT EXISTS (SELECT 1 FROM tblinterviewresult WHERE b.jobM_id = interviewR_jobId AND c.cand_id = interviewR_candId )
            ORDER BY a.intsched_date';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getCandMedClassification($id)
  {
    include "connection.php";
    // echo $id;
    $sql = 'SELECT a.medicalM_id, b.medicalC_id, b.medicalC_name, CONCAT(c.cand_lastname, ", ", c.cand_firstname, " ", COALESCE(c.cand_middlename, "")) AS CandName FROM tblmedicalmaster a 
            INNER JOIN tblmedicalclassification b ON b.medicalC_id = a.medicalM_medicalCId 
            INNER JOIN tblcandidates c ON c.cand_id = a.medicalM_candId
            WHERE c.cand_id = :candId';
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":candId", $id);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC) : 0;
  }

  function updateMedicalMaster($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $date = $this->getCurrentDate();
    $sql = "UPDATE tblmedicalmaster SET medicalM_candId = :candId, medicalM_medicalCId = :medicalCId, 
            medicalM_dateTime = :dateTime, medicalM_hrId = :hrId WHERE medicalM_id = :medicalMId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':candId', $data['candId']);
    $stmt->bindParam(':medicalCId', $data['medicalCId']);
    $stmt->bindParam(':dateTime', $date);
    $stmt->bindParam(':hrId', $data['hrId']);
    $stmt->bindParam(':medicalMId', $data['medicalMId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getJobQualification($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT a.jeduc_points, b.course_categoryName  FROM tbljobseducation a
    INNER JOIN tblcoursescategory b ON b.course_categoryId = a.jeduc_categoryId
    WHERE jeduc_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobEducation"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.jtrng_points, b.perT_name FROM tbljobstrainings a
    INNER JOIN tblpersonaltraining b ON b.perT_id = a.jtrng_trainingId
    WHERE jtrng_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobTrainings"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.jknow_points, b.knowledge_name FROM tbljobsknowledge a
    INNER JOIN tblpersonalknowledge b ON b.knowledge_id = a.jknow_knowledgeId
    WHERE jknow_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobKnowledge"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT a.jskills_points, b.perS_name FROM tbljobsskills a
    INNER JOIN tblpersonalskills b ON b.perS_id = a.jskills_skillsId
    WHERE jskills_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobSkills"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    $sql = "SELECT jwork_points, jwork_responsibilities FROM tbljobsworkexperience WHERE jwork_jobId  = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    $returnValue["jobExperience"] = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];

    return $returnValue;
  }

  function getHR()
  {
    include "connection.php";
    $sql = 'SELECT a.hr_id, CONCAT(a.hr_lastname, ", ", a.hr_firstname, " ", COALESCE(a.hr_middlename, "")) AS fullName, a.*, b.UserL_description, b.userL_id FROM tblhr a
            INNER JOIN tbluserlevel b ON a.hr_userLevel = b.userL_id
            ORDER BY a.hr_createdAt DESC';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function addHR($json)
  {
    // {"lastName": "Macario", "firstName": "Mel", "middleName": "Sabido", "contactNo": "0925467856", "email": "mel@gmail.com", "alternateEmail": "", "password": "Mel!123", "userLevel": 2}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblhr (hr_lastname, hr_firstname, hr_middlename, hr_contactNo, hr_email, hr_alternateEmail, hr_password, hr_userLevel, hr_createdAt) 
            VALUES (:lastName, :firstName, :middleName, :contactNo, :email, :alternateEmail, :password, :userLevel, NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":lastName", $data['lastname']);
    $stmt->bindParam(":firstName", $data['firstName']);
    $stmt->bindParam(":middleName", $data['middleName']);
    $stmt->bindParam(":contactNo", $data['contactNo']);
    $stmt->bindParam(":email", $data['email']);
    $stmt->bindParam(":alternateEmail", $data['alternateEmail']);
    $stmt->bindParam(":password", $data['password']);
    $stmt->bindParam(":userLevel", $data['userLevel']);
    $stmt->execute();
    $lastId = $conn->lastInsertId();
    return $stmt->rowCount() > 0 ? $lastId : 0;
  }

  function updateHR($json)
  {
    // {"lastName": "Macarios", "firstName": "Mel", "middleName": "Sabido", "contactNo": "0925467856", "email": "mel@gmail.com", "alternateEmail": "", "password": "Mel!123", "userLevel": 2}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblhr SET hr_lastname = :lastName, hr_firstname = :firstName, hr_middlename = :middleName, hr_contactNo = :contactNo, hr_email = :email, hr_alternateEmail = :alternateEmail, hr_password = :password, hr_userLevel = :userLevel WHERE hr_id = :hrId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":lastName", $data['lastName']);
    $stmt->bindParam(":firstName", $data['firstName']);
    $stmt->bindParam(":middleName", $data['middleName']);
    $stmt->bindParam(":contactNo", $data['contactNo']);
    $stmt->bindParam(":email", $data['email']);
    $stmt->bindParam(":alternateEmail", $data['alternateEmail']);
    $stmt->bindParam(":password", $data['password']);
    $stmt->bindParam(":userLevel", $data['userLevel']);
    $stmt->bindParam(":hrId", $data['hrId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteHR($json)
  {
    // {"hrId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    try {
      $sql = "DELETE FROM tblhr WHERE hr_id = :hrId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':hrId', $data['hrId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function getHRUserLevel()
  {
    include "connection.php";
    $sql = 'SELECT * FROM `tbluserlevel` WHERE userL_level <= 100 AND userL_level != 1';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function updateInterviewCriteriaMaster($json)
  {
    // {"criteriaId": 8, "question": "question", "points": 1, "interCriteriaId": 23}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblinterviewcriteriamaster SET inter_criteria_criteriaId = :criteriaId, inter_criteria_question = :question,
            inter_criteria_points = :points WHERE inter_criteria_id = :interCriteriaId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":criteriaId", $data['criteriaId']);
    $stmt->bindParam(":question", $data['question']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->bindParam(":interCriteriaId", $data['interCriteriaId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getAllCandidateResumes()
  {
    include "connection.php";
    $sql = 'SELECT * FROM tblcandresume';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }


  function getAllJobQualificationPoints($jobId)
  {
    include "connection.php";
    $totalPoints = 0;
    $sql = "SELECT jeduc_points FROM tbljobseducation WHERE jeduc_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $education = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($education != 0) {
      foreach ($education as $educ) {
        $totalPoints += $educ['jeduc_points'];
      }
    }

    $sql = "SELECT jtrng_points FROM tbljobstrainings WHERE jtrng_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $training = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($training != 0) {
      foreach ($training as $train) {
        $totalPoints += $train["jtrng_points"];
      }
    }

    $sql = "SELECT jwork_points FROM tbljobsworkexperience WHERE jwork_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $work = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($work != 0) {
      foreach ($work as $workExp) {
        $totalPoints += $workExp["jwork_points"];
      }
    }

    $sql = "SELECT jskills_points FROM tbljobsskills WHERE jskills_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $skills = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($skills != 0) {
      foreach ($skills as $skill) {
        $totalPoints += $skill["jskills_points"];
      }
    }

    $sql = "SELECT jlicense_points FROM tbljobslicense WHERE jlicense_jobId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $licenses = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($licenses != 0) {
      foreach ($licenses as $license) {
        $totalPoints += $license["jlicense_points"];
      }
    }

    return $totalPoints;
  }

  function getAllCandidateQualificationPoints($appId)
  {
    include "connection.php";
    $totalPoints = 0;
    $sql = "SELECT candEduc_points FROM tblcandeducpoints WHERE candEduc_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":appId", $appId);
    $stmt->execute();
    $education = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($education != 0) {
      foreach ($education as $educ) {
        $totalPoints += $educ["candEduc_points"];
      }
    }

    $sql = "SELECT candEmp_points FROM tblcandemppoints WHERE candEmp_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":appId", $appId);
    $stmt->execute();
    $employment = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($employment != 0) {
      foreach ($employment as $emp) {
        $totalPoints += $emp["candEmp_points"];
      }
    }

    $sql = "SELECT candSkill_points FROM tblcandskillpoints WHERE candSkill_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":appId", $appId);
    $stmt->execute();
    $skills = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($skills != 0) {
      foreach ($skills as $skill) {
        $totalPoints += $skill["candSkill_points"];
      }
    }

    $sql = "SELECT candTrain_points FROM tblcandtrainpoints WHERE candTrain_appId = :appId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":appId", $appId);
    $stmt->execute();
    $training = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
    if ($training != 0) {
      foreach ($training as $train) {
        $totalPoints += $train["candTrain_points"];
      }
    }



    return $totalPoints;
  }

  function getCandidateJobPoints($json)
  {
    // {"jobId": 20}
    include "connection.php";
    $data = json_decode($json, true);
    $jobId = $data['jobId'];
    $jobTotalPoints = $this->getAllJobQualificationPoints($jobId);
    $candidates = [];
    $result = [];

    $sql = "SELECT a.*, b.branch_location FROM tblapplications a
            INNER JOIN tblbranch b ON b.branch_id = a.app_branchId
            WHERE app_jobMId = :jobId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $jobId);
    $stmt->execute();
    $applications = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

    if ($applications != 0) {
      foreach ($applications as $app) {
        $sql = "SELECT s.status_id, s.status_name, a.appS_date
              FROM tblapplicationstatus a
              INNER JOIN tblstatus s ON s.status_id = a.appS_statusId
              WHERE a.appS_appId = :appId
              AND a.appS_id = (
                SELECT MAX(sub.appS_id) 
                FROM tblapplicationstatus sub 
                WHERE sub.appS_appId = :appId2
              )
              LIMIT 1";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":appId", $app["app_id"]);
        $stmt->bindParam(":appId2", $app["app_id"]);
        $stmt->execute();
        $statusData = $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC) : null;

        // Skip if no status or status is not Pending (1) or Processed (2)
        if (!$statusData || !in_array($statusData["status_id"], [1, 2])) {
          continue;
        }

        $sql = "SELECT CONCAT(cand_lastname, ', ', cand_firstname, ' ', COALESCE(cand_middleName, '')) AS full_name FROM tblcandidates WHERE cand_id = :candId";

        $stmt = $conn->prepare($sql);
        $stmt->bindParam(":candId", $app["app_candId"]);
        $stmt->execute();
        $candFullName = $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC)["full_name"] : "";

        $candidateTotalPoints = $this->getAllCandidateQualificationPoints($app["app_id"]);

        $candidates[] = [
          "branch" => $app["branch_location"],
          "applicationId" => $app["app_id"],
          "candidateId" => $app["app_candId"],
          "fullName" => $candFullName,
          "totalPoints" => $candidateTotalPoints,
          "percentage" => round($candidateTotalPoints / $jobTotalPoints * 100, 2),
          "status" => $statusData["status_name"],
          "date" => $statusData["appS_date"]
        ];
      }
    }

    $passingPercentage = $this->getJobPassingPercentage($json);
    $result = [
      "passingPercentage" => $passingPercentage,
      "jobTotalPoints" => $jobTotalPoints,
      "candidates" => $candidates
    ];

    return $result ? $result : 0;
  }


  function cancelJob($json)
  {
    // {"jobId": 20}
    include "connection.php";
    include "send_email.php";
    $sendEmail = new SendEmail();
    $data = json_decode($json, true);
    $conn->beginTransaction();
    try {
      $sql = "UPDATE tbljobsmaster SET jobM_status = 2 WHERE jobM_id = :jobId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->execute();

      $sql = "SELECT b.cand_email FROM tblapplications a
            INNER JOIN tblcandidates b ON b.cand_id = a.app_candId
            WHERE a.app_jobMId = :jobId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->execute();
      $candidate = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
      if (!empty($candidate)) {
        foreach ($candidate as $cand) {
          $emailSubject = "Job Cancelled";
          $emailBody = "The job you applied for has been cancelled by the HR.";
          $sendEmail->sendEmail($cand['cand_email'], $emailSubject, $emailBody);
        }
      }

      $conn->commit();
      return 1;
    } catch (PDOException $e) {
      $conn->rollBack();
      if ($e->getCode() == '23000') {
        return $e;
      }
      throw new Exception("Error processing job cancellation: " . $e->getMessage());
    }
  }

  function reactivateJob($json)
  {
    // {"jobId": 20}
    include "connection.php";
    include "send_email.php";
    $sendEmail = new SendEmail();
    $data = json_decode($json, true);
    $conn->beginTransaction();
    try {
      $sql = "UPDATE tbljobsmaster SET jobM_status = 1 WHERE jobM_id = :jobId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->execute();
      $sql = "SELECT b.cand_email FROM tblapplications a
            INNER JOIN tblcandidates b ON b.cand_id = a.app_candId
            WHERE a.app_jobMId = :jobId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->execute();
      $candidate = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
      if (!empty($candidate)) {
        foreach ($candidate as $cand) {
          $emailSubject = "Job Reactivated";
          $emailBody = "The job you applied for has been reactivated by the HR.";
          $sendEmail->sendEmail($cand['cand_email'], $emailSubject, $emailBody);
        }
      }
      $conn->commit();
    } catch (PDOException $e) {
      $conn->rollBack();
      if ($e->getCode() == '23000') {
        return $e;
      }
      throw new Exception("Error processing job reactivation: " . $e->getMessage());
    }
  }

  function getJobLicense($json)
  {
    // {"jobId": 23}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT a.*, b.license_master_name FROM tbljobslicense a 
            INNER JOIN tbllicensemaster b ON b.license_master_id = a.jlicense_licenceMId
            WHERE jlicense_jobId = :jobId
            ORDER BY license_master_name DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? json_encode($stmt->fetchAll(PDO::FETCH_ASSOC)) : [];
  }

  function updateJobLicense($json)
  {
    // {"licenseId": 5, "licenseMId": 2, "points": 5}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobslicense SET jlicense_licenceMId = :licenseMId, jlicense_points = :points WHERE jlicense_id = :licenseId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":licenseId", $data['licenseId']);
    $stmt->bindParam(":licenseMId", $data['licenseMId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobLicense($json)
  {
    // {"licenseId": 2}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobslicense WHERE jlicense_id = :licenseId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":licenseId", $data['licenseId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function addJobLicense($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobslicense (jlicense_jobId, jlicense_licenceMId, jlicense_points) VALUES (:jobId, :licenseMId, :points)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":licenseMId", $data['licenseMId']);
    $stmt->bindParam(":points", $data['points']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getBranch()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblbranch";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function addBranch($json)
  {
    // {"location": "Dhaka", "userId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tblbranch (branch_location, branch_userId, branch_createdAt) VALUES (:location, :userId, NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":location", $data['location']);
    $stmt->bindParam(":userId", $data['userId']);
    $stmt->execute();
    $lastId = $conn->lastInsertId();
    return $stmt->rowCount() > 0 ? $lastId : 0;
  }

  function updateBranch($json)
  {
    // {"branchId": 1, "location": "Dhaka"}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tblbranch SET branch_location = :location WHERE branch_id = :branchId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":branchId", $data['branchId']);
    $stmt->bindParam(":location", $data['location']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteBranch($json)
  {
    // {"branchId": 1}
    try {
      include "connection.php";
      $data = json_decode($json, true);
      $sql = "DELETE FROM tblbranch WHERE branch_id = :branchId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":branchId", $data['branchId']);
      $stmt->execute();
      return $stmt->rowCount() > 0 ? 1 : 0;
    } catch (PDOException $e) {
      if ($e->getCode() == '23000') {
        // Foreign key constraint violation
        return -1;
      }
      throw $e;
    }
  }

  function getJobBranch($json)
  {
    // {"jobId": 17}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT a.*, b.branch_location FROM tbljobbranch a
            INNER JOIN tblbranch b ON b.branch_id = a.jobB_branchId
            WHERE a.jobB_jobMId = :jobId
            ORDER BY b.branch_location DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function addJobBranch($json)
  {
    // {"jobId": 17, "branchId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "INSERT INTO tbljobbranch (jobB_jobMId, jobB_branchId) VALUES (:jobId, :branchId)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->bindParam(":branchId", $data['branchId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function updateJobBranch($json)
  {
    // {"branchId": 1, "jobBranchId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "UPDATE tbljobbranch SET jobB_branchId = :branchId WHERE jobB_id = :jobBranchId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":branchId", $data['branchId']);
    $stmt->bindParam(":jobBranchId", $data['jobBranchId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function deleteJobBranch($json)
  {
    // {"jobBranchId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "DELETE FROM tbljobbranch WHERE jobB_id = :jobBranchId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobBranchId", $data['jobBranchId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? 1 : 0;
  }

  function getNumberOfApplicationInJob($json)
  {
    // {"from":"2024-06-30T16:00:00.000Z","to":"2025-09-05T16:00:00.000Z"}
    include "connection.php";
    $data = json_decode($json, true);
    $startDate = $data['from'];
    $endDate = $data['to'];
    $sql = "SELECT b.jobM_id, b.jobM_title, COUNT(DISTINCT a.app_candId) as totalCandidate FROM tblapplications a 
            INNER JOIN tbljobsmaster b ON b.jobM_id = a.app_jobMId
            WHERE a.app_datetime BETWEEN :startDate AND :endDate
            GROUP BY b.jobM_id
            ORDER BY totalCandidate DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":startDate", $startDate);
    $stmt->bindParam(":endDate", $endDate);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getLoginLogs()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblloginlogs";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;
  }

  function getJobExams($json)
  {
    // {"jobId": 25}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tblexam WHERE exam_jobMId = :jobId ORDER BY exam_isActive DESC";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":jobId", $data['jobId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function getSelectedExam($json)
  {
    // {"examId": 1}
    include "connection.php";
    $data = json_decode($json, true);
    $sql = "SELECT * FROM tblexam WHERE exam_id = :examId";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":examId", $data['examId']);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetch(PDO::FETCH_ASSOC) : [];
  }

  function scheduleExam($json)
  {
    // {"examId":17,"date":"2025-09-08","jobId":25}
    include "connection.php";
    include "send_email.php";
    try {
      $sendEmail = new SendEmail();
      $conn->beginTransaction();
      $data = json_decode($json, true);
      $sql = "UPDATE tblexam SET exam_isActive = 0, exam_scheduleDate = NULL WHERE exam_jobMId = :jobId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->execute();

      $sql = "UPDATE tblexam SET exam_scheduleDate = :date, exam_isActive = 1 WHERE exam_id = :examId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":date", $data['date']);
      $stmt->bindParam(":examId", $data['examId']);
      $stmt->execute();
      $stmt->rowCount() > 0 ? 1 : 0;

      $sql = "SELECT a.cand_email FROM tblcandidates a 
              INNER JOIN tblapplications b ON a.cand_id = b.app_candId
              INNER JOIN tblapplicationstatus c ON b.app_id = c.appS_appId
              WHERE b.app_jobMId = :jobId AND c.appS_statusId = 5";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->execute();
      $candidates = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

      if ($candidates != 0) {
        foreach ($candidates as $cand) {
          $emailSubject = "Your exam is scheduled!";
          $emailBody = "The scheduled date is: " . $data['date'];
          $sendEmail->sendEmail($cand['cand_email'], $emailSubject, $emailBody);
        }
      }

      $conn->commit();
      return 1;
    } catch (\Throwable $th) {
      $conn->rollBack();
      return $th;
    }
  }

  function updateExamSchedule($json)
  {
    // {"examId":17,"date":"2025-09-06","jobId":25}
    include "connection.php";
    include "send_email.php";
    try {
      $conn->beginTransaction();
      $sendEmail = new SendEmail();
      $data = json_decode($json, true);
      $sql = "UPDATE tblexam SET exam_scheduleDate = :date WHERE exam_id = :examId";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":date", $data['date']);
      $stmt->bindParam(":examId", $data['examId']);
      $stmt->execute();

      $sql = "SELECT a.cand_email FROM tblcandidates a 
              INNER JOIN tblapplications b ON a.cand_id = b.app_candId
              INNER JOIN tblapplicationstatus c ON b.app_id = c.appS_appId
              WHERE b.app_jobMId = :jobId AND c.appS_statusId = 5";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":jobId", $data['jobId']);
      $stmt->execute();
      $candidates = $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : 0;

      if ($candidates != 0) {
        foreach ($candidates as $cand) {
          $emailSubject = "Your exam is scheduled!";
          $emailBody = "The exam scheduled date is: " . $data['date'];
          $sendEmail->sendEmail($cand['cand_email'], $emailSubject, $emailBody);
        }
      }
      $conn->commit();
      return 1;
    } catch (\Throwable $th) {
      $conn->rollBack();
      return $th;
    }
  }

  function getBGCheckCategory()
  {
    include "connection.php";
    $sql = "SELECT * FROM tblbackgroundcheckcategory";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->rowCount() > 0 ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
  }

  function backgroundCheckCandidate($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $conn->beginTransaction();
    try {
      $isPassed = $data['isPassed'] == true ? 1 : 0;
      $sql = "INSERT INTO tblbireport(bireport_candId, bireport_statusId, bireport_recommendation, bireport_hrId, bireport_datetime) 
      VALUES (:bireport_candId, :bireport_statusId, :bireport_recommendation, :bireport_hrId, NOW())";
      $stmt = $conn->prepare($sql);
      $data = json_decode($json, true);
      $stmt->bindParam(":bireport_candId", $data['candId']);
      $stmt->bindParam(":bireport_statusId", $isPassed);
      $stmt->bindParam(":bireport_recommendation", $data['remarks']);
      $stmt->bindParam(":bireport_hrId", $data['hrId']);
      $stmt->execute();
      $reportId = $conn->lastInsertId();
      $sql = "INSERT INTO tblbicheckresult(biC_bireportId, biC_employmentCheck, biC_educationCheck, biC_characterCheck, biC_creditCheck, biC_datetime, biC_hrId ) 
              VALUES (:biC_bireportId, :biC_employmentCheck, :biC_educationCheck, :biC_characterCheck, :biC_creditCheck, NOW(), :biC_hrId)";
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(":biC_bireportId", $reportId);
      $stmt->bindParam(":biC_employmentCheck", $data['employmentCheck']);
      $stmt->bindParam(":biC_educationCheck", $data['educationCheck']);
      $stmt->bindParam(":biC_characterCheck", $data['characterCheck']);
      $stmt->bindParam(":biC_creditCheck", $data['creditCheck']);
      $stmt->bindParam(":biC_hrId", $data['hrId']);
      $stmt->execute();
      $conn->commit();
      return 1;
    } catch (PDOException $th) {
      $conn->rollBack();
      return $th;
    }
  }

} //admin

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

$json = $_POST["json"] ?? "0";
$operation = $_POST["operation"] ?? "0";

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
  case "getJobDetails":
    echo $admin->getJobDetails($json);
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
    echo json_encode($admin->getJobInterviewDetails($json));
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
    echo json_encode($admin->getInterviewCriteria());
    break;
  case "getCriteriaAndCategory":
    echo $admin->getCriteriaAndCategory();
    break;
  case "getCriteriaForInterview":
    echo json_encode($admin->getCriteriaForInterview($json));
    break;
  case "getCandInterviewResult":
    echo json_encode($admin->getCandInterviewResult($json));
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
    echo json_encode($admin->getExamDetails($json));
    break;
  case "addExamQuestions":
    echo $admin->addExamQuestions($json);
    break;
  case "updateExamQuestion":
    echo $admin->updateExamQuestion($json);
    break;
  case "updateExamMaster":
    echo $admin->updateExamMaster($json);
    break;
  case "getCourseCategory":
    echo json_encode($admin->getCourseCategory());
    break;
  case "getCourse":
    echo json_encode($admin->getCourse());
    break;
  case "getInstitution":
    echo json_encode($admin->getInstitution());
    break;
  case "getKnowledge":
    echo json_encode($admin->getKnowledge());
    break;
  case "getLicenseMaster":
    echo json_encode($admin->getLicenseMaster());
    break;
  case "getLicenseType":
    echo json_encode($admin->getLicenseType());
    break;
  case "getSkills":
    echo json_encode($admin->getSkills());
    break;
  case "getTraining":
    echo json_encode($admin->getTraining());
    break;
  case "addCourseCategory":
    echo $admin->addCourseCategory($json);
    break;
  case "getAddCourseDropdown":
    echo $admin->getAddCourseDropdown();
    break;
  case "addCourse":
    echo $admin->addCourse($json);
    break;
  case "addInstitution":
    echo $admin->addInstitution($json);
    break;
  case "addKnowledge":
    echo $admin->addKnowledge($json);
    break;
  case "addLicenseMaster":
    echo $admin->addLicenseMaster($json);
    break;
  case "addLicenseType":
    echo $admin->addLicenseType($json);
    break;
  case "addSkills":
    echo $admin->addSkills($json);
    break;
  case "addTraining":
    echo $admin->addTraining($json);
    break;
  case "updateCourseCategory":
    echo $admin->updateCourseCategory($json);
    break;
  case "updateCourse":
    echo $admin->updateCourse($json);
    break;
  case "updateInstitution":
    echo $admin->updateInstitution($json);
    break;
  case "updateKnowledge":
    echo $admin->updateKnowledge($json);
    break;
  case "deleteCourseCategory":
    echo $admin->deleteCourseCategory($json);
    break;
  case "deleteCourse":
    echo $admin->deleteCourse($json);
    break;
  case "deleteInstitution":
    echo $admin->deleteInstitution($json);
    break;
  case "deleteKnowledge":
    echo $admin->deleteKnowledge($json);
    break;
  case "getGeneralExam":
    echo json_encode($admin->getGeneralExam());
    break;
  case "getGeneralExamDetails":
    echo json_encode($admin->getGeneralExamDetails());
    break;
  case "updateLicenseMaster":
    echo $admin->updateLicenseMaster($json);
    break;
  case "deleteLicenseMaster":
    echo $admin->deleteLicenseMaster($json);
    break;
  case "updateLicenseType":
    echo $admin->updateLicenseType($json);
    break;
  case "deleteLicenseType":
    echo $admin->deleteLicenseType($json);
    break;
  case "updateSkill":
    echo $admin->updateSkill($json);
    break;
  case "deleteSkill":
    echo $admin->deleteSkill($json);
    break;
  case "updateTraining":
    echo $admin->updateTraining($json);
    break;
  case "deleteTraining":
    echo $admin->deleteTraining($json);
    break;
  case "getCandidateExamPoints":
    echo json_encode($admin->getCandidateExamPoints($json));
    break;
  case "sendJobOffer":
    echo $admin->sendJobOffer($json);
    break;
  case "getInterviewCandidates":
    echo json_encode($admin->getInterviewCandidates($json));
    break;
  case "getExamCandidates":
    echo json_encode($admin->getExamCandidates($json));
    break;
  case "updateJobMaster":
    echo $admin->updateJobMaster($json);
    break;
  case "batchSetInterview":
    echo $admin->batchSetInterview($json);
    break;
  case "getPendingDetails":
    echo json_encode($admin->getPendingDetails($json));
    break;
  case "getBackgroundCheckCandidates":
    echo json_encode($admin->getBackgroundCheckCandidates($json));
    break;
  case "getJobOfferCandidates":
    echo json_encode($admin->getJobOfferCandidates($json));
    break;
  case "addInterviewCategory":
    echo $admin->addInterviewCategory($json);
    break;
  case "deleteInterviewCategory":
    echo $admin->deleteInterviewCategory($json);
    break;
  case "updateInterviewCategory":
    echo $admin->updateInterviewCategory($json);
    break;
  case "getInterviewCriteriaMasterFiles":
    echo json_encode($admin->getInterviewCriteriaMasterFiles());
    break;
  case "deleteInterviewCriteriaMaster":
    echo $admin->deleteInterviewCriteriaMaster($json);
    break;
  case "addInterviewCriteria":
    echo $admin->addInterviewCriteria($json);
    break;
  case "updateInterviewCriteria":
    echo $admin->updateInterviewCriteria($json);
    break;
  case "getDecisionPendingCandidates":
    echo json_encode($admin->getDecisionPendingCandidates($json));
    break;
  case "getEmployedCandidates":
    echo json_encode($admin->getEmployedCandidates($json));
    break;
  case "updateJobOffer":
    echo $admin->updateJobOffer($json);
    break;
  case "deleteJobOffer":
    echo $admin->deleteJobOffer($json);
    break;
  case "getReappliedCandidates":
    echo json_encode($admin->getReappliedCandidates($json));
    break;
  case "getPotentialCandidates":
    echo json_encode($admin->getPotentialCandidates($json));
    break;
  case "sendPotentialCandidateEmail":
    echo $admin->sendPotentialCandidateEmail($json);
    break;
  case "calculateCandidatePoints":
    echo json_encode($admin->calculateCandidatePoints(18, 10));
    break;
  case "getAllJobWithCandidates":
    echo $admin->getAllJobWithCandidates();
    break;
  case "getMedicalCandidate":
    echo json_encode($admin->getMedicalCandidate($json));
    break;
  case "getMedicalClassification":
    echo json_encode($admin->getMedicalClassification());
    break;
  case "addMedicalMaster":
    echo json_encode($admin->addMedicalMaster($json));
    break;
  case "getAdminActivityLogs":
    echo json_encode($admin->getAdminActivityLogs());
    break;
  case "getInterviewSchedule":
    echo json_encode($admin->getInterviewSchedule());
    break;
  case "updateMedicalMaster":
    echo json_encode($admin->updateMedicalMaster($json));
    break;
  case "getJobQualification":
    echo json_encode($admin->getJobQualification($json));
    break;
  case "getHR":
    echo json_encode($admin->getHR());
    break;
  case "addHR":
    echo json_encode($admin->addHR($json));
    break;
  case "updateHR":
    echo json_encode($admin->updateHR($json));
    break;
  case "deleteHR":
    echo json_encode($admin->deleteHR($json));
    break;
  case "getHRUserLevel":
    echo json_encode($admin->getHRUserLevel());
    break;
  case "updateInterviewCriteriaMaster":
    echo $admin->updateInterviewCriteriaMaster($json);
    break;
  case "getAllCandidateResumes":
    echo json_encode($admin->getAllCandidateResumes());
    break;
  case "getCandidateJobPoints":
    echo json_encode($admin->getCandidateJobPoints($json));
    break;
  case "cancelJob":
    echo $admin->cancelJob($json);
    break;
  case "reactivateJob":
    echo $admin->reactivateJob($json);
    break;
  case "updateJobLicense":
    echo $admin->updateJobLicense($json);
    break;
  case "getJobLicense":
    echo $admin->getJobLicense($json);
    break;
  case "deleteJobLicense":
    echo $admin->deleteJobLicense($json);
    break;
  case "addJobLicense":
    echo $admin->addJobLicense($json);
    break;
  case "getPotentialCandidateProfile":
    echo $admin->getPotentialCandidateProfile($json);
    break;
  case "getBranch":
    echo json_encode($admin->getBranch());
    break;
  case "addBranch":
    echo $admin->addBranch($json);
    break;
  case "updateBranch":
    echo $admin->updateBranch($json);
    break;
  case "deleteBranch":
    echo $admin->deleteBranch($json);
    break;
  case "getJobBranch":
    echo json_encode($admin->getJobBranch($json));
    break;
  case "addJobBranch":
    echo $admin->addJobBranch($json);
    break;
  case "updateJobBranch":
    echo $admin->updateJobBranch($json);
    break;
  case "deleteJobBranch":
    echo $admin->deleteJobBranch($json);
    break;
  case "getNumberOfApplicationInJob":
    echo json_encode($admin->getNumberOfApplicationInJob($json));
    break;
  case "getLoginLogs":
    echo json_encode($admin->getLoginLogs());
    break;
  case "getJobExams":
    echo json_encode($admin->getJobExams($json));
    break;
  case "getSelectedExam":
    echo json_encode($admin->getSelectedExam($json));
    break;
  case "scheduleExam":
    echo $admin->scheduleExam($json);
    break;
  case "updateExamSchedule":
    echo $admin->updateExamSchedule($json);
    break;
  case "getBGCheckCategory":
    echo json_encode($admin->getBGCheckCategory());
    break;
  case "backgroundCheckCandidate":
    echo json_encode($admin->backgroundCheckCandidate($json));
    break;
  default:
    echo "WALAY '$operation' NGA OPERATION SA UBOS HAHAHAHA BOBO";
    break;
}
