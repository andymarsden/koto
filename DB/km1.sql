SELECT 
  strategy_lpft_workflow_1.root_step_id, 
  strategy_lpft_workflow_1.workflow_step_id AS conversation_step_id, 
  strategy_lpft_workflow_1.workflow_step_type AS conversation_type, 
  strategy_lpft_workflow_1.person_id, 
  strategy_lpft_workflow_1.status AS conversation_status, 
  strategy_lpft_workflow_1.proposed_date, 
  strategy_lpft_workflow_1.completed_date AS conversation_completed_date, 
  derivedtbl_1.started_date AS assessment_started_date, 
  derivedtbl_1.status AS assessment_status, 
  derivedtbl_1.workflow_step_type AS assessment_type 
FROM 
  dbo.events_all AS strategy_lpft_workflow_1 
  LEFT OUTER JOIN (
    SELECT 
      root_step_id, 
      workflow_step_id, 
      workflow_step_type, 
      person_id, 
      status, 
      started_date 
    FROM 
      dbo.events_all AS strategy_lpft_workflow_1 
    WHERE 
      (
        workflow_step_type = 'Adult Needs Assessment'
      ) 
      AND (status <> 'CANCELLED')
  ) AS derivedtbl_1 ON strategy_lpft_workflow_1.root_step_id = derivedtbl_1.root_step_id 
WHERE 
  (
    strategy_lpft_workflow_1.workflow_step_type = 'Adult LPFT Social Care Initial Conversation'
  )
