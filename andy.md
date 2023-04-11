``SELECT        dbo.CARE_PACKAGES.PERSON_ID, dbo.CARE_PACKAGES.START_DATE, dbo.CARE_PACKAGES.END_DATE, dbo.SERVICE_TYPES.DESCRIPTION, dbo.CARE_PACKAGES.PACKAGE_TYPE_ID, 
                         dbo.PACKAGE_TYPES.DESCRIPTION AS Expr1, dbo.SERVICE_TYPES.ID, dbo.PACKAGE_SERVICES.START_DATE AS Expr2, dbo.PACKAGE_SERVICES.END_DATE AS Expr3, dbo.PACKAGE_SERVICES.CARE_PACKAGE_ID
FROM            dbo.PACKAGE_SERVICES INNER JOIN
                         dbo.SERVICE_TYPES ON dbo.PACKAGE_SERVICES.SERVICE_TYPE_ID = dbo.SERVICE_TYPES.ID INNER JOIN
                         dbo.CARE_PACKAGES ON dbo.PACKAGE_SERVICES.CARE_PACKAGE_ID = dbo.CARE_PACKAGES.ID INNER JOIN
                         dbo.PACKAGE_TYPES ON dbo.CARE_PACKAGES.PACKAGE_TYPE_ID = dbo.PACKAGE_TYPES.ID
WHERE        (dbo.CARE_PACKAGES.PERSON_ID = 89115)``




``SELECT        TOP (100) PERCENT dbo.adults_staging_services.person_id AS Expr1, dbo.adults_staging_services.care_package_start_date, dbo.adults_staging_services.service_type, dbo.adults_staging_services.package_type_id, 
                         dbo.adults_staging_services.service_id, dbo.adults_staging_services.package_start_date, dbo.adults_staging_services.package_end_date, dbo.adults_staging_services.care_package_id, 
                         dbo.SALT_SERVICE_MAPPINGS.SERVICE_RANKING, dbo.strategy_lpft_workflow.*, dbo.strategy_lpft_workflow.proposed_date AS Expr2
FROM            dbo.adults_staging_services INNER JOIN
                         dbo.SALT_SERVICE_MAPPINGS ON dbo.adults_staging_services.service_id = dbo.SALT_SERVICE_MAPPINGS.SERVICE_TYPE_ID INNER JOIN
                         dbo.strategy_lpft_workflow ON dbo.adults_staging_services.person_id = dbo.strategy_lpft_workflow.person_id
WHERE        (dbo.adults_staging_services.person_id = 3348198)
ORDER BY Expr2``




``SELECT        care_package_id, Expr1, MIN(package_start_date) AS Expr3, MAX(CASE WHEN package_end_date IS NULL THEN '9999-01-01' ELSE package_end_date END) AS Expr2, care_package_start_date, service_type
FROM            (SELECT        TOP (100) PERCENT dbo.adults_staging_services.person_id AS Expr1, dbo.adults_staging_services.care_package_start_date, dbo.adults_staging_services.service_type, 
                                                    dbo.adults_staging_services.package_type_id, dbo.adults_staging_services.service_id, dbo.adults_staging_services.package_start_date, dbo.adults_staging_services.package_end_date, 
                                                    dbo.adults_staging_services.care_package_id, dbo.SALT_SERVICE_MAPPINGS.SERVICE_RANKING, dbo.strategy_lpft_workflow.proposed_date AS Expr2, dbo.strategy_lpft_workflow.root_step_id, 
                                                    dbo.strategy_lpft_workflow.workflow_step_id, dbo.strategy_lpft_workflow.workflow_step_type, dbo.strategy_lpft_workflow.person_id, dbo.strategy_lpft_workflow.depth, dbo.strategy_lpft_workflow.template_id, 
                                                    dbo.strategy_lpft_workflow.proposed_date, dbo.strategy_lpft_workflow.incoming_date, dbo.strategy_lpft_workflow.started_date, dbo.strategy_lpft_workflow.completed_date, 
                                                    dbo.strategy_lpft_workflow.cancelled_date, dbo.strategy_lpft_workflow.status, dbo.strategy_lpft_workflow.assigned_team, dbo.strategy_lpft_workflow.assigned_worker, dbo.strategy_lpft_workflow.assigned_team_id, 
                                                    dbo.strategy_lpft_workflow.assigned_worker_id, dbo.strategy_lpft_workflow.root_started_date, dbo.strategy_lpft_workflow.root_proposed_date, dbo.strategy_lpft_workflow.days_proposed_to_started, 
                                                    dbo.strategy_lpft_workflow.days_started_to_completed, dbo.strategy_lpft_workflow.days_proposed_to_completed, dbo.strategy_lpft_workflow.days_root_started_to_current_completed, 
                                                    dbo.strategy_lpft_workflow.days_root_proposed_to_current_completed, dbo.strategy_lpft_workflow.working_days_proposed_to_started, dbo.strategy_lpft_workflow.working_days_started_to_completed, 
                                                    dbo.strategy_lpft_workflow.working_days_proposed_to_completed, dbo.strategy_lpft_workflow.working_days_root_started_to_current_completed, 
                                                    dbo.strategy_lpft_workflow.working_days_root_proposed_to_current_completed
                          FROM            dbo.adults_staging_services INNER JOIN
                                                    dbo.SALT_SERVICE_MAPPINGS ON dbo.adults_staging_services.service_id = dbo.SALT_SERVICE_MAPPINGS.SERVICE_TYPE_ID INNER JOIN
                                                    dbo.strategy_lpft_workflow ON dbo.adults_staging_services.person_id = dbo.strategy_lpft_workflow.person_id
                          WHERE        (dbo.adults_staging_services.person_id = 3348198)
                          ORDER BY Expr2) AS derivedtbl_1
GROUP BY care_package_id, Expr1, care_package_start_date, service_type``

ADD SERVICE STATUS.

#### Simon Tasks
- Run Services and reviews
- Services > Does leaving res care and goign back in count as 2?
- Do we need to focus on PERMANENT?
