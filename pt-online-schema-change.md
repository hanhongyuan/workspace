pt-online-schema-change --alter "add INDEX idx_user_login_token_app_create(tenant_wx_app_id, create_time)" h=rm-bp1qn4bl8d8p9mnm44o.mysql.rds.aliyuncs.com,P=3369,p=f7na4ZQmCcXhx5gGKsr3,u=sjfxadmin,D=authorization_service,t=user_login_token  --no-check-replication-filters  --execute



alter table user_service.erp_member_info add index `idx_erp_member_tenant_mobile` (`tenant_id`,`mobile_no`);


pt-online-schema-change --alter "add index idx_erp_member_tenant_mobile (tenant_id,mobile_no)" h=rm-bp1qn4bl8d8p9mnm44o.mysql.rds.aliyuncs.com,P=3369,p=f7na4ZQmCcXhx5gGKsr3,u=sjfxadmin,D=user_service,t=erp_member_info  --no-check-replication-filters  --execute


pt-online-schema-change --alter "add index idx_tenant_app_id_open_id (tenant_app_id, open_id)" h=rm-bp1qn4bl8d8p9mnm44o.mysql.rds.aliyuncs.com,P=3369,p=f7na4ZQmCcXhx5gGKsr3,u=sjfxadmin,D=qrcode_service,t=qrcode_scan_log  --no-check-replication-filters  --execute


create index idx_tenant_app_id_open_id
	on qrcode_service.qrcode_scan_log (tenant_app_id, open_id);


	ALTER TABLE `platform`.`taskassignment` ADD INDEX `idx_BID_UID_TaskTime_VendorID_TaskType` (`BID`, `UID`, `TaskTime`, `VendorID`, `TaskType`);

pt-online-schema-change --alter "add index idx_BID_UID_TaskTime_VendorID_TaskType (BID, UID,TaskTime,VendorID,TaskType)" h=rm-bp1qn4bl8d8p9mnm44o.mysql.rds.aliyuncs.com,P=3369,p=f7na4ZQmCcXhx5gGKsr3,u=sjfxadmin,D=platform,t=taskassignment  --no-check-replication-filters  --execute