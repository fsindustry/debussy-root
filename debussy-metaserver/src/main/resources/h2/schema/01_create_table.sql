/*==============================================================*/
/* Table: meta_cluster                                          */
/*==============================================================*/
create table meta_cluster
(
   cluster_id           int(11) not null default 0 comment 'kafka集群ID',
   cluster_name         varchar(48) not null comment 'kafka集群名称',
   cluster_desc         varchar(256) not null comment '集群描述',
   region               varchar(12) not null comment '集群所在地域',
   zk_addr              varchar(1024) not null comment 'zookeeper集群地址；',
   controller_broker    int not null comment '集群controller对应的brokerId',
   controller_epoch     int not null comment 'controller选举次数',
   broker_count         int not null comment '集群对应的broker数量',
   create_time          timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   update_time          timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '最后更新时间',
   primary key (cluster_id)
);

comment on table meta_cluster is '集群元信息';


/*==============================================================*/
/* Table: meta_topic                                            */
/*==============================================================*/
create table meta_topic
(
   topic_id             bigint not null auto_increment comment '记录的唯一标识',
   topic_name           varchar(256) not null comment 'topic名字，格式：accountId__topicName',
   partition_count      int(11) not null comment '分区数',
   replication_factor   int(11) not null comment '副本数',
   msg_timestamp_type   varchar(32) not null default 'CreateTime' comment 'message timestamp type',
   create_time          timestamp not null default CURRENT_TIMESTAMP comment '创建时间',
   update_time          timestamp not null default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '最后更新时间',
   create_by            bigint unsigned not null comment '创建数据源的用户ID；',
   update_by            bigint not null comment '最近一次更新数据源的用户ID；',
   enabled              tinyint(1) not null comment '用户是否可用：
            0 不可用；
            1 可用；',
   deleted              tinyint(1) not null comment '当前记录是否删除：
            0 未删除
            1 删除',
   user_id              varchar(128) not null comment 'IAM的AccountId',
   cluster_id           int(11) default 0 comment 'kafka集群ID',
   primary key (topic_id),
   unique key AK_key_name_deleted (topic_name, deleted)
);

comment on table meta_topic is 'topic元信息';
