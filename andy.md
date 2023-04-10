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
