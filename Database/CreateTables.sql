DROP TABLE TR_FAHRZEUG
go

DROP TABLE T_FAHRZEUG
go


DROP TABLE TZ_FAHRZEUGMARKETYP
go


DROP TABLE TR_FAHRZEUGTYP
go


DROP TABLE TR_FAHRZEUGART
go


DROP TABLE T_NUTZER
go


CREATE TABLE T_FAHRZEUG
(
	FZG_ID  int  IDENTITY (1,1) ,
	FZG_SCHILDNR  nvarchar(50)  NOT NULL ,
	FZG_RAHMENNR  nvarchar(50)  NULL ,
	FZG_STAMMNR  nvarchar(50)  NULL ,
	FZG_ERSTEINVERKEHR  datetime  NULL ,
	FZG_FAHRZEUGNR  nvarchar(50)  NULL ,
	FZG_NUT_ID  int  NULL ,
	FZG_FZA_ID  int  NULL ,
	FZG_FMT_ID  int  NULL 
)
go


ALTER TABLE T_FAHRZEUG
	ADD CONSTRAINT  XPKT_FAHRZEUG PRIMARY KEY   NONCLUSTERED (FZG_ID  ASC)
go


CREATE TABLE T_NUTZER
(
	NUT_ID  int  IDENTITY (1,1) ,
	NUT_NAME  nvarchar(50)  NOT NULL ,
	NUT_PLZ  int  NULL ,
	NUT_ORT  nvarchar(50)  NULL 
)
go


ALTER TABLE T_NUTZER
	ADD CONSTRAINT  XPKT_NUTZER PRIMARY KEY   NONCLUSTERED (NUT_ID  ASC)
go


CREATE TABLE TR_FAHRZEUGART
(
	FZA_ID  int  IDENTITY (1,1) ,
	FZA_BEZEICHNUNG  nvarchar(50)  NOT NULL ,
	FZA_KEY  char(3)  NOT NULL 
)
go


ALTER TABLE TR_FAHRZEUGART
	ADD CONSTRAINT  XPKTR_FAHRZEUGART PRIMARY KEY   NONCLUSTERED (FZA_ID  ASC)
go


CREATE TABLE TR_FAHRZEUGTYP
(
	FZT_ID  int  IDENTITY (1,1) ,
	FZT_BEZEICHNUNG  nvarchar(50)  NOT NULL 
)
go


ALTER TABLE TR_FAHRZEUGTYP
	ADD CONSTRAINT  XPKTR_FAHRZEUGTYP PRIMARY KEY   NONCLUSTERED (FZT_ID  ASC)
go


CREATE TABLE TZ_FAHRZEUGMARKETYP
(
	FMT_ID  int  IDENTITY (1,1) ,
	FMT_BEZEICHNUNG  nvarchar(50)  NULL ,
	FMT_FZT_ID  int  NULL 
)
go


ALTER TABLE TZ_FAHRZEUGMARKETYP
	ADD CONSTRAINT  XPKTZ_FAHRZEUGMARKETYP PRIMARY KEY   NONCLUSTERED (FMT_ID  ASC)
go



ALTER TABLE T_FAHRZEUG
	ADD CONSTRAINT  FK_NUT_FZG FOREIGN KEY (FZG_NUT_ID) REFERENCES T_NUTZER(NUT_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE T_FAHRZEUG
	ADD CONSTRAINT  FK_FZA_FZG FOREIGN KEY (FZG_FZA_ID) REFERENCES TR_FAHRZEUGART(FZA_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE T_FAHRZEUG
	ADD CONSTRAINT  FK_FMT_FZG FOREIGN KEY (FZG_FMT_ID) REFERENCES TZ_FAHRZEUGMARKETYP(FMT_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



ALTER TABLE TZ_FAHRZEUGMARKETYP
	ADD CONSTRAINT  FK_FZT_FMT FOREIGN KEY (FMT_FZT_ID) REFERENCES TR_FAHRZEUGTYP(FZT_ID)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go



CREATE TRIGGER tD_T_FAHRZEUG ON T_FAHRZEUG FOR DELETE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:51 */
/* DELETE trigger on T_FAHRZEUG */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:51 */
    /* T_NUTZER FK_NUT_FZG T_FAHRZEUG on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0004247b", PARENT_OWNER="", PARENT_TABLE="T_NUTZER"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_NUT_FZG", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="FK_NUT_FZG", FK_COLUMNS="FZG_NUT_ID" */
    IF EXISTS (SELECT * FROM deleted,T_NUTZER
      WHERE
        /* %JoinFKPK(deleted,T_NUTZER," = "," AND") */
        deleted.FZG_NUT_ID = T_NUTZER.NUT_ID AND
        NOT EXISTS (
          SELECT * FROM T_FAHRZEUG
          WHERE
            /* %JoinFKPK(T_FAHRZEUG,T_NUTZER," = "," AND") */
            T_FAHRZEUG.FZG_NUT_ID = T_NUTZER.NUT_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last T_FAHRZEUG because T_NUTZER exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:51 */
    /* TR_FAHRZEUGART FK_FZA_FZG T_FAHRZEUG on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGART"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FZA_FZG", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="FK_FZA_FZG", FK_COLUMNS="FZG_FZA_ID" */
    IF EXISTS (SELECT * FROM deleted,TR_FAHRZEUGART
      WHERE
        /* %JoinFKPK(deleted,TR_FAHRZEUGART," = "," AND") */
        deleted.FZG_FZA_ID = TR_FAHRZEUGART.FZA_ID AND
        NOT EXISTS (
          SELECT * FROM T_FAHRZEUG
          WHERE
            /* %JoinFKPK(T_FAHRZEUG,TR_FAHRZEUGART," = "," AND") */
            T_FAHRZEUG.FZG_FZA_ID = TR_FAHRZEUGART.FZA_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last T_FAHRZEUG because TR_FAHRZEUGART exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:51 */
    /* TZ_FAHRZEUGMARKETYP FK_FMT_FZG T_FAHRZEUG on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TZ_FAHRZEUGMARKETYP"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FMT_FZG", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="FK_FMT_FZG", FK_COLUMNS="FZG_FMT_ID" */
    IF EXISTS (SELECT * FROM deleted,TZ_FAHRZEUGMARKETYP
      WHERE
        /* %JoinFKPK(deleted,TZ_FAHRZEUGMARKETYP," = "," AND") */
        deleted.FZG_FMT_ID = TZ_FAHRZEUGMARKETYP.FMT_ID AND
        NOT EXISTS (
          SELECT * FROM T_FAHRZEUG
          WHERE
            /* %JoinFKPK(T_FAHRZEUG,TZ_FAHRZEUGMARKETYP," = "," AND") */
            T_FAHRZEUG.FZG_FMT_ID = TZ_FAHRZEUGMARKETYP.FMT_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last T_FAHRZEUG because TZ_FAHRZEUGMARKETYP exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:51 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go

CREATE TRIGGER tU_T_FAHRZEUG ON T_FAHRZEUG FOR UPDATE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* UPDATE trigger on T_FAHRZEUG */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insFZG_ID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:51 */
  /* T_NUTZER FK_NUT_FZG T_FAHRZEUG on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0004be68", PARENT_OWNER="", PARENT_TABLE="T_NUTZER"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_NUT_FZG", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="FK_NUT_FZG", FK_COLUMNS="FZG_NUT_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(FZG_NUT_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,T_NUTZER
        WHERE
          /* %JoinFKPK(inserted,T_NUTZER) */
          inserted.FZG_NUT_ID = T_NUTZER.NUT_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.FZG_NUT_ID IS NULL
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update T_FAHRZEUG because T_NUTZER does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:51 */
  /* TR_FAHRZEUGART FK_FZA_FZG T_FAHRZEUG on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGART"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FZA_FZG", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="FK_FZA_FZG", FK_COLUMNS="FZG_FZA_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(FZG_FZA_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TR_FAHRZEUGART
        WHERE
          /* %JoinFKPK(inserted,TR_FAHRZEUGART) */
          inserted.FZG_FZA_ID = TR_FAHRZEUGART.FZA_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.FZG_FZA_ID IS NULL
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update T_FAHRZEUG because TR_FAHRZEUGART does not exist.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  /* TZ_FAHRZEUGMARKETYP FK_FMT_FZG T_FAHRZEUG on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TZ_FAHRZEUGMARKETYP"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FMT_FZG", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="FK_FMT_FZG", FK_COLUMNS="FZG_FMT_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(FZG_FMT_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TZ_FAHRZEUGMARKETYP
        WHERE
          /* %JoinFKPK(inserted,TZ_FAHRZEUGMARKETYP) */
          inserted.FZG_FMT_ID = TZ_FAHRZEUGMARKETYP.FMT_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.FZG_FMT_ID IS NULL
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update T_FAHRZEUG because TZ_FAHRZEUGMARKETYP does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go


CREATE TRIGGER tD_T_NUTZER ON T_NUTZER FOR DELETE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* DELETE trigger on T_NUTZER */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    /* T_NUTZER FK_NUT_FZG T_FAHRZEUG on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001028f", PARENT_OWNER="", PARENT_TABLE="T_NUTZER"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_NUT_FZG", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="FK_NUT_FZG", FK_COLUMNS="FZG_NUT_ID" */
    IF EXISTS (
      SELECT * FROM deleted,T_FAHRZEUG
      WHERE
        /*  %JoinFKPK(T_FAHRZEUG,deleted," = "," AND") */
        T_FAHRZEUG.FZG_NUT_ID = deleted.NUT_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete T_NUTZER because T_FAHRZEUG exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go

CREATE TRIGGER tU_T_NUTZER ON T_NUTZER FOR UPDATE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* UPDATE trigger on T_NUTZER */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insNUT_ID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  /* T_NUTZER FK_NUT_FZG T_FAHRZEUG on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011d43", PARENT_OWNER="", PARENT_TABLE="T_NUTZER"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_NUT_FZG", C2P_VERB_PHRASE="R/2", 
    FK_CONSTRAINT="FK_NUT_FZG", FK_COLUMNS="FZG_NUT_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(NUT_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,T_FAHRZEUG
      WHERE
        /*  %JoinFKPK(T_FAHRZEUG,deleted," = "," AND") */
        T_FAHRZEUG.FZG_NUT_ID = deleted.NUT_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update T_NUTZER because T_FAHRZEUG exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go


CREATE TRIGGER tD_TR_FAHRZEUGART ON TR_FAHRZEUGART FOR DELETE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* DELETE trigger on TR_FAHRZEUGART */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    /* TR_FAHRZEUGART FK_FZA_FZG T_FAHRZEUG on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00010bc4", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGART"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FZA_FZG", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="FK_FZA_FZG", FK_COLUMNS="FZG_FZA_ID" */
    IF EXISTS (
      SELECT * FROM deleted,T_FAHRZEUG
      WHERE
        /*  %JoinFKPK(T_FAHRZEUG,deleted," = "," AND") */
        T_FAHRZEUG.FZG_FZA_ID = deleted.FZA_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TR_FAHRZEUGART because T_FAHRZEUG exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go

CREATE TRIGGER tU_TR_FAHRZEUGART ON TR_FAHRZEUGART FOR UPDATE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* UPDATE trigger on TR_FAHRZEUGART */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insFZA_ID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  /* TR_FAHRZEUGART FK_FZA_FZG T_FAHRZEUG on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012560", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGART"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FZA_FZG", C2P_VERB_PHRASE="R/3", 
    FK_CONSTRAINT="FK_FZA_FZG", FK_COLUMNS="FZG_FZA_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(FZA_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,T_FAHRZEUG
      WHERE
        /*  %JoinFKPK(T_FAHRZEUG,deleted," = "," AND") */
        T_FAHRZEUG.FZG_FZA_ID = deleted.FZA_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TR_FAHRZEUGART because T_FAHRZEUG exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go


CREATE TRIGGER tD_TR_FAHRZEUGTYP ON TR_FAHRZEUGTYP FOR DELETE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* DELETE trigger on TR_FAHRZEUGTYP */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    /* TR_FAHRZEUGTYP FK_FZT_FMT TZ_FAHRZEUGMARKETYP on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001179c", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGTYP"
    CHILD_OWNER="", CHILD_TABLE="TZ_FAHRZEUGMARKETYP"
    P2C_VERB_PHRASE="FK_FZT_FMT", C2P_VERB_PHRASE="R/4", 
    FK_CONSTRAINT="FK_FZT_FMT", FK_COLUMNS="FMT_FZT_ID" */
    IF EXISTS (
      SELECT * FROM deleted,TZ_FAHRZEUGMARKETYP
      WHERE
        /*  %JoinFKPK(TZ_FAHRZEUGMARKETYP,deleted," = "," AND") */
        TZ_FAHRZEUGMARKETYP.FMT_FZT_ID = deleted.FZT_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TR_FAHRZEUGTYP because TZ_FAHRZEUGMARKETYP exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go

CREATE TRIGGER tU_TR_FAHRZEUGTYP ON TR_FAHRZEUGTYP FOR UPDATE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* UPDATE trigger on TR_FAHRZEUGTYP */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insFZT_ID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  /* TR_FAHRZEUGTYP FK_FZT_FMT TZ_FAHRZEUGMARKETYP on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001342b", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGTYP"
    CHILD_OWNER="", CHILD_TABLE="TZ_FAHRZEUGMARKETYP"
    P2C_VERB_PHRASE="FK_FZT_FMT", C2P_VERB_PHRASE="R/4", 
    FK_CONSTRAINT="FK_FZT_FMT", FK_COLUMNS="FMT_FZT_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(FZT_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,TZ_FAHRZEUGMARKETYP
      WHERE
        /*  %JoinFKPK(TZ_FAHRZEUGMARKETYP,deleted," = "," AND") */
        TZ_FAHRZEUGMARKETYP.FMT_FZT_ID = deleted.FZT_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TR_FAHRZEUGTYP because TZ_FAHRZEUGMARKETYP exists.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go


CREATE TRIGGER tD_TZ_FAHRZEUGMARKETYP ON TZ_FAHRZEUGMARKETYP FOR DELETE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* DELETE trigger on TZ_FAHRZEUGMARKETYP */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    /* TZ_FAHRZEUGMARKETYP FK_FMT_FZG T_FAHRZEUG on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00029448", PARENT_OWNER="", PARENT_TABLE="TZ_FAHRZEUGMARKETYP"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FMT_FZG", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="FK_FMT_FZG", FK_COLUMNS="FZG_FMT_ID" */
    IF EXISTS (
      SELECT * FROM deleted,T_FAHRZEUG
      WHERE
        /*  %JoinFKPK(T_FAHRZEUG,deleted," = "," AND") */
        T_FAHRZEUG.FZG_FMT_ID = deleted.FMT_ID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete TZ_FAHRZEUGMARKETYP because T_FAHRZEUG exists.'
      GOTO ERROR
    END

    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    /* TR_FAHRZEUGTYP FK_FZT_FMT TZ_FAHRZEUGMARKETYP on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGTYP"
    CHILD_OWNER="", CHILD_TABLE="TZ_FAHRZEUGMARKETYP"
    P2C_VERB_PHRASE="FK_FZT_FMT", C2P_VERB_PHRASE="R/4", 
    FK_CONSTRAINT="FK_FZT_FMT", FK_COLUMNS="FMT_FZT_ID" */
    IF EXISTS (SELECT * FROM deleted,TR_FAHRZEUGTYP
      WHERE
        /* %JoinFKPK(deleted,TR_FAHRZEUGTYP," = "," AND") */
        deleted.FMT_FZT_ID = TR_FAHRZEUGTYP.FZT_ID AND
        NOT EXISTS (
          SELECT * FROM TZ_FAHRZEUGMARKETYP
          WHERE
            /* %JoinFKPK(TZ_FAHRZEUGMARKETYP,TR_FAHRZEUGTYP," = "," AND") */
            TZ_FAHRZEUGMARKETYP.FMT_FZT_ID = TR_FAHRZEUGTYP.FZT_ID
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last TZ_FAHRZEUGMARKETYP because TR_FAHRZEUGTYP exists.'
      GOTO ERROR
    END


    /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go

CREATE TRIGGER tU_TZ_FAHRZEUGMARKETYP ON TZ_FAHRZEUGMARKETYP FOR UPDATE AS
/* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
/* UPDATE trigger on TZ_FAHRZEUGMARKETYP */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insFMT_ID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  /* TZ_FAHRZEUGMARKETYP FK_FMT_FZG T_FAHRZEUG on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002cd5d", PARENT_OWNER="", PARENT_TABLE="TZ_FAHRZEUGMARKETYP"
    CHILD_OWNER="", CHILD_TABLE="T_FAHRZEUG"
    P2C_VERB_PHRASE="FK_FMT_FZG", C2P_VERB_PHRASE="R/5", 
    FK_CONSTRAINT="FK_FMT_FZG", FK_COLUMNS="FZG_FMT_ID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(FMT_ID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,T_FAHRZEUG
      WHERE
        /*  %JoinFKPK(T_FAHRZEUG,deleted," = "," AND") */
        T_FAHRZEUG.FZG_FMT_ID = deleted.FMT_ID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update TZ_FAHRZEUGMARKETYP because T_FAHRZEUG exists.'
      GOTO ERROR
    END
  END

  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  /* TR_FAHRZEUGTYP FK_FZT_FMT TZ_FAHRZEUGMARKETYP on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="TR_FAHRZEUGTYP"
    CHILD_OWNER="", CHILD_TABLE="TZ_FAHRZEUGMARKETYP"
    P2C_VERB_PHRASE="FK_FZT_FMT", C2P_VERB_PHRASE="R/4", 
    FK_CONSTRAINT="FK_FZT_FMT", FK_COLUMNS="FMT_FZT_ID" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(FMT_FZT_ID)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,TR_FAHRZEUGTYP
        WHERE
          /* %JoinFKPK(inserted,TR_FAHRZEUGTYP) */
          inserted.FMT_FZT_ID = TR_FAHRZEUGTYP.FZT_ID
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.FMT_FZT_ID IS NULL
    IF @validcnt + @nullcnt != @NUMROWS
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update TZ_FAHRZEUGMARKETYP because TR_FAHRZEUGTYP does not exist.'
      GOTO ERROR
    END
  END


  /* ERwin Builtin Montag, 6. Dezember 2010 21:26:52 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END
go

