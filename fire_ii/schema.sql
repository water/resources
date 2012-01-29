/**%518%186%*******************************************************************************************/
/******************************************************************************************************/
create table ACTUALCOURSES
(
  ACOU_INTERNALID        integer not null,
  ACOU_RESERVE1        varchar(100),
  ACOU_RESERVE2        varchar(100),
  constraint COURSES_PK primary key (ACOU_INTERNALID)
)
;
/**%835%18%********************************************************************************************/
/******************************************************************************************************/
create table ADMINISTRATOR
(
  ADM_ID        integer not null,
  ADM_NAME        varchar(100) not null,
  ADM_PASSWORD        varchar(100) not null,
  ADM_EMAIL        varchar(100) not null,
  ADM_SYSTEMPASSWORD        varchar(100) not null,
  ADM_RESERVE1        varchar(100),
  ADM_RESERVE2        varchar(100),
  constraint SYS_C00376856 primary key (ADM_ID)
)
;
/**%711%35%********************************************************************************************/
/******************************************************************************************************/
create table COURSES
(
  COU_ID        integer not null,
  COU_NAME        varchar(100) not null,
  COU_CODE        varchar(100) not null,
  COU_UNIVERSITY        varchar(100) not null,
  COU_CREDIT        float(126) not null,
  constraint COU_PK primary key (COU_ID)
)
;
/**%501%30%********************************************************************************************/
/******************************************************************************************************/
create table GIVENCOURSES
(
  GCOU_ID        integer not null,
  GCOU_YEAR        integer not null,
  GCOU_PERIOD        integer not null,
  GACTUALCOU_ID        integer,
  GCOU_RESERVE1        varchar(100),
  GCOU_RESERVE2        varchar(100),
  constraint GCOURSES_PK primary key (GCOU_ID,GCOU_YEAR,GCOU_PERIOD),
  constraint GCOU_COU_FK foreign key (GCOU_ID) references COURSES,
  constraint GCOU_ACTUALCOU_FK foreign key (GACTUALCOU_ID) references ACTUALCOURSES
)
;
/**%38%197%********************************************************************************************/
/******************************************************************************************************/
create table GROUPS
(
  GRO_INTERNALID        integer not null,
  GRO_NUM        integer not null,
  GRO_RESERVE1        varchar(100),
  GRO_RESERVE2        varchar(100),
  GRO_COUID_FK        integer,
  constraint SYS_C00376865 primary key (GRO_INTERNALID),
  constraint SYS_C00376866 foreign key (GRO_COUID_FK) references ACTUALCOURSES
)
;
/**%315%253%*******************************************************************************************/
/******************************************************************************************************/
create table LABS
(
  LAB_NO        integer not null,
  LAB_COU_INTERNALID        integer not null,
  LAB_NAME        varchar(40) not null,
  LAB_MINMEMBERS        integer,
  LAB_MAXMEMBERS        integer,
  LAB_FIRSTDEADLINE        timestamp,
  LAB_SECONDDEADLINE        timestamp,
  LAB_RESERVE1        varchar(40),
  LAB_RESERVE2        varchar(40),
  constraint LABS_PK primary key (LAB_NO,LAB_COU_INTERNALID),
  constraint SYS_C00376872 foreign key (LAB_COU_INTERNALID) references ACTUALCOURSES
)
;
/**%48%313%********************************************************************************************/
/******************************************************************************************************/
create table LABINGROUP
(
  LABGRO_GRO_INTERNALID        integer not null,
  LABGRO_LAB_NO        integer not null,
  LABGRO_COU_INTERNALID        integer not null,
  STATUS        varchar(100) not null,
  LABGROUP_RESERVE1        varchar(100),
  LABGROUP_RESERVE2        varchar(100),
  constraint LABINGROUP_PK primary key (LABGRO_GRO_INTERNALID,LABGRO_LAB_NO,LABGRO_COU_INTERNALID),
  constraint SYS_C00376875 foreign key (LABGRO_GRO_INTERNALID) references GROUPS,
  constraint LANINGROUP_LAB_FK foreign key (LABGRO_LAB_NO,LABGRO_COU_INTERNALID) references LABS
)
;
/**%247%56%********************************************************************************************/
/******************************************************************************************************/
create table STUDENTS
(
  STU_PERSONNUM        varchar(100) not null,
  STU_GCOUID        integer not null,
  STU_GCOUYEAR        integer not null,
  STU_GCOUPERIOD        integer not null,
  STU_FIRSTNAME        varchar(100) not null,
  STU_LASTNAME        varchar(100) not null,
  STU_EMAIL        varchar(100) not null,
  STU_PASSWORD        varchar(100) not null,
  STU_RESERVE1        varchar(100),
  STU_RESERVE2        varchar(100),
  constraint STUDENT_PK primary key (STU_PERSONNUM,STU_GCOUID,STU_GCOUYEAR,STU_GCOUPERIOD),
  constraint STU_GCOURSE_FK foreign key (STU_GCOUID,STU_GCOUYEAR,STU_GCOUPERIOD) references GIVENCOURSES
)
;
/**%31%64%*********************************************************************************************/
/******************************************************************************************************/
create table STUDENTREGISTERGROUP
(
  STU_PERSONNUM_FK        varchar(100) not null,
  STU_GCOUID_FK        integer not null,
  STU_GCOUYEAR_FK        integer not null,
  STU_GCOUPERIOD_FK        integer not null,
  GRO_INTERNALID_FK        integer not null,
  constraint STUDENTREGISTERGROUP_PK primary key (STU_PERSONNUM_FK,STU_GCOUID_FK,STU_GCOUYEAR_FK,STU_GCOUPERIOD_FK,GRO_INTERNALID_FK),
  constraint STUREG_STU_FK foreign key (STU_PERSONNUM_FK,STU_GCOUID_FK,STU_GCOUYEAR_FK,STU_GCOUPERIOD_FK) references STUDENTS,
  constraint STUREG_GRO_FK foreign key (GRO_INTERNALID_FK) references GROUPS
)
;
/**%834%415%*******************************************************************************************/
/******************************************************************************************************/
create table TEACHERS
(
  TEA_EMAIL        varchar(100) not null,
  TEA_FIRSTNAME        varchar(100) not null,
  TEA_LASTNAME        varchar(100) not null,
  TEA_PASSWORD        varchar(100) not null,
  TEA_RESERVE1        varchar(100),
  TEA_RESERVE2        varchar(100),
  constraint TEACHERS_PK primary key (TEA_EMAIL)
)
;
/**%255%409%*******************************************************************************************/
/******************************************************************************************************/
create table SUBMISSIONS
(
  SUB_NO        integer not null,
  SUB_LAB_NO        integer not null,
  SUB_COU_INTERNALID        integer not null,
  SUB_GRO_INTERNALID        integer not null,
  SUB_TEACHER        varchar(100),
  SUB_UPLOAD_DATE        timestamp not null,
  SUB_FILE        blob not null,
  SUB_COMMENT        clob,
  SUB_UPLOADNAME        varchar(100) not null,
  SUB_SIZE        longvarchar(0),
  SUB_UPLOADER        varchar(100),
  SUB_GROUP        integer,
  constraint SUB_PK primary key (SUB_LAB_NO,SUB_COU_INTERNALID,SUB_GRO_INTERNALID,SUB_NO),
  constraint SUB_TEA_FK foreign key (SUB_TEACHER) references TEACHERS,
  constraint SUB_LAB_FK foreign key (SUB_GRO_INTERNALID,SUB_LAB_NO,SUB_COU_INTERNALID) references LABINGROUP
)
;
/**%583%294%*******************************************************************************************/
/******************************************************************************************************/
create table TEACHERGRADELAB
(
  TEALAB_TEA_EMAIL        varchar(100) not null,
  TEALAB_LAB_NO        integer not null,
  TEALAB_COU_INTERNALID        integer not null,
  TEALAB_WEIGHT        float(126),
  TEALAB_RESERVE1        varchar(100),
  TEALAB_RESERVE2        varchar(100),
  constraint TEALAB_PK primary key (TEALAB_TEA_EMAIL,TEALAB_LAB_NO,TEALAB_COU_INTERNALID),
  constraint SYS_C00377114 foreign key (TEALAB_TEA_EMAIL) references TEACHERS,
  constraint TEALAB_LAB_FK foreign key (TEALAB_LAB_NO,TEALAB_COU_INTERNALID) references LABS
)
;
/**%738%189%*******************************************************************************************/
/******************************************************************************************************/
create table TEAMANAGECOURSE
(
  COU_ID        integer not null,
  TEA_EMAIL        varchar(100) not null,
  TITLE        integer not null,
  constraint TEAMANAGECOURSE_PK primary key (COU_ID,TEA_EMAIL),
  constraint COU_ID_FK foreign key (COU_ID) references ACTUALCOURSES,
  constraint TEA_EMAIL_FK foreign key (TEA_EMAIL) references TEACHERS
)
;
