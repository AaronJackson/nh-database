drop procedure if exists sp_email_update;

/*
 *   
 */

DELIMITER //
CREATE PROCEDURE sp_email_update
(
  IN  email_id      int,
  IN  email_status  varchar(16),
  OUT err           varchar(100)
)
SQL SECURITY DEFINER
BEGIN
  declare ck_exists int;
  set err = '';

  main: begin

    if (email_status not in ('SENT', 'FAILED', 'BOUNCED')) then
      set err = 'Invalid email_status';
      leave main;
    end if;

    select count(*) into ck_exists
    from snackspace_emails e 
    where e.email_id = email_id;

    if (ck_exists != 1) then
      set err = 'Unable to find email';
      leave main;
    end if;

    update snackspace_emails 
    set snackspace_emails = email_status
    where snackspace_emails = email_id;

  end main;

END //
DELIMITER ;

