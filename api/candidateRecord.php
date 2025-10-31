<?php
include "headers.php";

class CandidateRecord
{
  function getAllCandidates()
  {
    include "connection.php";
    
    try {
      $sql = "SELECT 
                c.cand_id,
                c.cand_firstname,
                c.cand_lastname,
                c.cand_middlename,
                c.cand_email,
                c.cand_contactNo,
                c.cand_profPic,
                c.cand_dateofBirth,
                c.cand_sex,
                CONCAT(
                  COALESCE(c.cand_presentStreet, ''), 
                  CASE WHEN c.cand_presentBarangay IS NOT NULL THEN CONCAT(', ', c.cand_presentBarangay) ELSE '' END,
                  CASE WHEN c.cand_presentCity IS NOT NULL THEN CONCAT(', ', c.cand_presentCity) ELSE '' END,
                  CASE WHEN c.cand_presentProvince IS NOT NULL THEN CONCAT(', ', c.cand_presentProvince) ELSE '' END,
                  CASE WHEN c.cand_presentPostalCode IS NOT NULL THEN CONCAT(' ', c.cand_presentPostalCode) ELSE '' END
                ) as cand_presentAddress,
                CONCAT(
                  COALESCE(c.cand_permanentStreet, ''), 
                  CASE WHEN c.cand_permanentBarangay IS NOT NULL THEN CONCAT(', ', c.cand_permanentBarangay) ELSE '' END,
                  CASE WHEN c.cand_permanentCity IS NOT NULL THEN CONCAT(', ', c.cand_permanentCity) ELSE '' END,
                  CASE WHEN c.cand_permanentProvince IS NOT NULL THEN CONCAT(', ', c.cand_permanentProvince) ELSE '' END,
                  CASE WHEN c.cand_permanentPostalCode IS NOT NULL THEN CONCAT(' ', c.cand_permanentPostalCode) ELSE '' END
                ) as cand_permanentAddress,
                c.cand_isEmployed,
                a.app_id,
                a.app_datetime,
                a.app_branchId,
                j.jobM_title as job_title,
                s.status_name,
                b.branch_location
              FROM tblcandidates c
              LEFT JOIN tblapplications a ON c.cand_id = a.app_candId
              LEFT JOIN tbljobsmaster j ON a.app_jobMId = j.jobM_id
              LEFT JOIN (
                SELECT 
                  appS_appId,
                  appS_statusId,
                  appS_date
                FROM tblapplicationstatus appS1
                WHERE appS_id = (
                  SELECT MAX(appS_id) 
                  FROM tblapplicationstatus appS2 
                  WHERE appS2.appS_appId = appS1.appS_appId
                )
              ) latest_status ON a.app_id = latest_status.appS_appId
              LEFT JOIN tblstatus s ON latest_status.appS_statusId = s.status_id
              LEFT JOIN tblbranch b ON a.app_branchId = b.branch_id
              WHERE a.app_id IS NOT NULL
              ORDER BY a.app_datetime DESC";
      
      $stmt = $conn->prepare($sql);
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      
      if (empty($result)) {
        echo json_encode([]);
        return;
      }
      
      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }

  function getCandidateById($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $candId = $data['candId'];
    
    try {
      $sql = "SELECT 
                c.cand_id,
                c.cand_firstname,
                c.cand_lastname,
                c.cand_middlename,
                c.cand_email,
                c.cand_contactNo,
                c.cand_profPic,
                c.cand_dateofBirth,
                c.cand_sex,
                CONCAT(
                  COALESCE(c.cand_presentStreet, ''), 
                  CASE WHEN c.cand_presentBarangay IS NOT NULL THEN CONCAT(', ', c.cand_presentBarangay) ELSE '' END,
                  CASE WHEN c.cand_presentCity IS NOT NULL THEN CONCAT(', ', c.cand_presentCity) ELSE '' END,
                  CASE WHEN c.cand_presentProvince IS NOT NULL THEN CONCAT(', ', c.cand_presentProvince) ELSE '' END,
                  CASE WHEN c.cand_presentPostalCode IS NOT NULL THEN CONCAT(' ', c.cand_presentPostalCode) ELSE '' END
                ) as cand_presentAddress,
                CONCAT(
                  COALESCE(c.cand_permanentStreet, ''), 
                  CASE WHEN c.cand_permanentBarangay IS NOT NULL THEN CONCAT(', ', c.cand_permanentBarangay) ELSE '' END,
                  CASE WHEN c.cand_permanentCity IS NOT NULL THEN CONCAT(', ', c.cand_permanentCity) ELSE '' END,
                  CASE WHEN c.cand_permanentProvince IS NOT NULL THEN CONCAT(', ', c.cand_permanentProvince) ELSE '' END,
                  CASE WHEN c.cand_permanentPostalCode IS NOT NULL THEN CONCAT(' ', c.cand_permanentPostalCode) ELSE '' END
                ) as cand_permanentAddress,
                c.cand_isEmployed,
                a.app_id,
                a.app_datetime,
                a.app_branchId,
                j.jobM_title as job_title,
                s.status_name,
                b.branch_location
              FROM tblcandidates c
              LEFT JOIN tblapplications a ON c.cand_id = a.app_candId
              LEFT JOIN tbljobsmaster j ON a.app_jobMId = j.jobM_id
              LEFT JOIN (
                SELECT 
                  appS_appId,
                  appS_statusId,
                  appS_date
                FROM tblapplicationstatus appS1
                WHERE appS_id = (
                  SELECT MAX(appS_id) 
                  FROM tblapplicationstatus appS2 
                  WHERE appS2.appS_appId = appS1.appS_appId
                )
              ) latest_status ON a.app_id = latest_status.appS_appId
              LEFT JOIN tblstatus s ON latest_status.appS_statusId = s.status_id
              LEFT JOIN tblbranch b ON a.app_branchId = b.branch_id
              WHERE c.cand_id = :candId
              ORDER BY a.app_datetime DESC";
      
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':candId', $candId, PDO::PARAM_INT);
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      
      if (empty($result)) {
        echo json_encode([]);
        return;
      }
      
      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }

  function getCandidateApplications($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $candId = $data['candId'];
    
    try {
      $sql = "SELECT 
                a.app_id,
                a.app_datetime,
                j.jobM_title as job_title,
                j.jobM_id,
                s.status_name,
                b.branch_location,
                a.app_branchId
              FROM tblapplications a
              INNER JOIN tbljobsmaster j ON a.app_jobMId = j.jobM_id
              LEFT JOIN (
                SELECT 
                  appS_appId,
                  appS_statusId,
                  appS_date
                FROM tblapplicationstatus appS1
                WHERE appS_id = (
                  SELECT MAX(appS_id) 
                  FROM tblapplicationstatus appS2 
                  WHERE appS2.appS_appId = appS1.appS_appId
                )
              ) latest_status ON a.app_id = latest_status.appS_appId
              LEFT JOIN tblstatus s ON latest_status.appS_statusId = s.status_id
              LEFT JOIN tblbranch b ON a.app_branchId = b.branch_id
              WHERE a.app_candId = :candId
              ORDER BY a.app_datetime DESC";
      
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':candId', $candId, PDO::PARAM_INT);
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      
      if (empty($result)) {
        echo json_encode([]);
        return;
      }
      
      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }

  function getCandidateQualifications($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $appId = $data['appId'];
    
    try {
      // Get education points - join with job education requirements
      $educationSql = "SELECT 
                        cep.*,
                        c.course_categoryName, 
                        IFNULL(cep.candEduc_points, 0) AS candEduc_points, 
                        IFNULL(jeduc.jeduc_points, 0) AS jeduc_points,
                        d.courses_name
                      FROM tblcandeducpoints cep
                      INNER JOIN tbljobseducation jeduc ON jeduc.jeduc_id = cep.candEduc_educId
                      LEFT JOIN tblcoursescategory c ON c.course_categoryId = jeduc.jeduc_categoryId
                      LEFT JOIN tblcourses d ON d.courses_id = jeduc.jeduc_courseId
                      WHERE cep.candEduc_appId = :appId";
      
      $educationStmt = $conn->prepare($educationSql);
      $educationStmt->bindParam(':appId', $appId, PDO::PARAM_INT);
      $educationStmt->execute();
      $education = $educationStmt->fetchAll(PDO::FETCH_ASSOC);

      // Get skills points - join with job skills requirements
      $skillsSql = "SELECT 
                     csp.*,
                     jskills.jskills_text, 
                     IFNULL(csp.candSkill_points, 0) AS candSkill_points, 
                     IFNULL(jskills.jskills_points, 0) AS jskills_points 
                   FROM tblcandskillpoints csp
                   INNER JOIN tbljobsskills jskills ON jskills.jskills_id = csp.candSkill_jobSkillsId
                   WHERE csp.candSkill_appId = :appId";
      
      $skillsStmt = $conn->prepare($skillsSql);
      $skillsStmt->bindParam(':appId', $appId, PDO::PARAM_INT);
      $skillsStmt->execute();
      $skills = $skillsStmt->fetchAll(PDO::FETCH_ASSOC);

      // Get training points - join with job training requirements
      $trainingSql = "SELECT 
                       ctp.*,
                       jtrng.jtrng_text, 
                       IFNULL(ctp.candTrain_points, 0) AS candTrain_points, 
                       IFNULL(jtrng.jtrng_points, 0) AS jtrng_points 
                     FROM tblcandtrainpoints ctp
                     INNER JOIN tbljobstrainings jtrng ON jtrng.jtrng_id = ctp.candTrain_trngId
                     WHERE ctp.candTrain_appId = :appId";
      
      $trainingStmt = $conn->prepare($trainingSql);
      $trainingStmt->bindParam(':appId', $appId, PDO::PARAM_INT);
      $trainingStmt->execute();
      $training = $trainingStmt->fetchAll(PDO::FETCH_ASSOC);

      // Get employment points - join with job work experience requirements
      $employmentSql = "SELECT 
                         cep.*,
                         jwork.jwork_responsibilities, 
                         IFNULL(cep.candEmp_points, 0) AS candEmp_points, 
                         IFNULL(jwork.jwork_points, 0) AS jwork_points 
                       FROM tblcandemppoints cep
                       INNER JOIN tbljobsworkexperience jwork ON jwork.jwork_id = cep.candEmp_jworkId
                       WHERE cep.candEmp_appId = :appId";
      
      $employmentStmt = $conn->prepare($employmentSql);
      $employmentStmt->bindParam(':appId', $appId, PDO::PARAM_INT);
      $employmentStmt->execute();
      $employment = $employmentStmt->fetchAll(PDO::FETCH_ASSOC);

      // Get license points - join with job license requirements
      $licenseSql = "SELECT 
                      clp.*,
                      lm.license_master_name,
                      IFNULL(clp.candLic_points, 0) AS candLicense_points, 
                      IFNULL(jlicense.jlicense_points, 0) AS jlicense_points 
                    FROM tblcandlicensepoints clp
                    INNER JOIN tbljobslicense jlicense ON jlicense.jlicense_id = clp.candLic_licenseId
                    INNER JOIN tbllicensemaster lm ON lm.license_master_id = jlicense.jlicense_licenceMId
                    WHERE clp.candLic_appId = :appId";
      
      $licenseStmt = $conn->prepare($licenseSql);
      $licenseStmt->bindParam(':appId', $appId, PDO::PARAM_INT);
      $licenseStmt->execute();
      $licenses = $licenseStmt->fetchAll(PDO::FETCH_ASSOC);

      $result = [
        "education" => $education,
        "experience" => $employment,
        "skills" => $skills,
        "training" => $training,
        "license" => $licenses
      ];

      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }

  function getCandidateInterviewResults($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $candId = $data['candId'];
    
    try {
      $sql = "SELECT 
                ir.*,
                j.jobM_title,
                h.hr_firstname,
                h.hr_lastname
              FROM tblinterviewresult ir
              LEFT JOIN tbljobsmaster j ON ir.interviewR_jobId = j.jobM_id
              LEFT JOIN tblhr h ON ir.interviewR_hrId = h.hr_id
              WHERE ir.interviewR_candId = :candId
              ORDER BY ir.interviewR_date DESC";
      
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':candId', $candId, PDO::PARAM_INT);
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      
      if (empty($result)) {
        echo json_encode([]);
        return;
      }
      
      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }

  function getCandidateExamResults($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $candId = $data['candId'];
    
    try {
      $sql = "SELECT 
                er.*,
                j.jobM_title,
                e.exam_name
              FROM tblexamresult er
              LEFT JOIN tbljobsmaster j ON er.examR_jobMId = j.jobM_id
              LEFT JOIN tblexam e ON er.examR_examId = e.exam_id
              WHERE er.examR_candId = :candId
              ORDER BY er.examR_date DESC";
      
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':candId', $candId, PDO::PARAM_INT);
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      
      if (empty($result)) {
        echo json_encode([]);
        return;
      }
      
      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }

  function getCandidateExamAnswers($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $examResultId = $data['examResultId'];
    
    try {
      $sql = "SELECT 
                eca.*,
                eq.examQ_text,
                eq.examQ_points,
                ec.examC_text as choice_text,
                ec.examC_isCorrect
              FROM tblexamcandidateanswer eca
              LEFT JOIN tblexamquestion eq ON eca.examcandA_questionId = eq.examQ_id
              LEFT JOIN tblexamchoices ec ON eca.examcandA_choiceId = ec.examC_id
              WHERE eca.examcandA_resultId = :examResultId
              ORDER BY eq.examQ_id";
      
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':examResultId', $examResultId, PDO::PARAM_INT);
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      
      if (empty($result)) {
        echo json_encode([]);
        return;
      }
      
      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }

  function getCandidateMedicalRecords($json)
  {
    include "connection.php";
    $data = json_decode($json, true);
    $candId = $data['candId'];
    
    try {
      $sql = "SELECT 
                mm.*,
                mc.medicalC_name,
                mc.medicalC_type,
                j.jobM_title,
                h.hr_firstname,
                h.hr_lastname
              FROM tblmedicalmaster mm
              LEFT JOIN tblmedicalclassification mc ON mm.medicalM_medicalCId = mc.medicalC_id
              LEFT JOIN tbljobsmaster j ON mm.medicalM_jobMid = j.jobM_id
              LEFT JOIN tblhr h ON mm.medicalM_hrId = h.hr_id
              WHERE mm.medicalM_candId = :candId
              ORDER BY mm.medicalM_datetime DESC";
      
      $stmt = $conn->prepare($sql);
      $stmt->bindParam(':candId', $candId, PDO::PARAM_INT);
      $stmt->execute();
      $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
      
      if (empty($result)) {
        echo json_encode([]);
        return;
      }
      
      echo json_encode($result);
      
    } catch (PDOException $e) {
      echo json_encode(["error" => "Database error: " . $e->getMessage()]);
    }
  }
}

$json = $_POST["json"] ?? "0";
$operation = $_POST["operation"] ?? "0";

$candidateRecord = new CandidateRecord();

switch ($operation) {
  case "getAllCandidates":
    $candidateRecord->getAllCandidates();
    break;
  case "getCandidateById":
    $candidateRecord->getCandidateById($json);
    break;
  case "getCandidateApplications":
    $candidateRecord->getCandidateApplications($json);
    break;
  case "getCandidateQualifications":
    $candidateRecord->getCandidateQualifications($json);
    break;
  case "getCandidateInterviewResults":
    $candidateRecord->getCandidateInterviewResults($json);
    break;
  case "getCandidateExamResults":
    $candidateRecord->getCandidateExamResults($json);
    break;
  case "getCandidateExamAnswers":
    $candidateRecord->getCandidateExamAnswers($json);
    break;
  case "getCandidateMedicalRecords":
    $candidateRecord->getCandidateMedicalRecords($json);
    break;
  default:
    echo json_encode(["error" => "Operation not found: " . $operation]);
    break;
}
