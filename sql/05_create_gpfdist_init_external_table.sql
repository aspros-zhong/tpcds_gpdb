DROP EXTERNAL TABLE IF EXISTS ext_do_create_seg_gpfdist;
--CREATE EXTERNAL WEB TABLE ext_do_datagen ( result TEXT ) EXECUTE $$CHILD=$(($GP_SEGMENT_ID + 1));cd $GP_SEG_DATADIR/TPCDS/;$GP_SEG_DATADIR/TPCDS/dsdgen_do $SCALE $SEGCOUNT $CHILD$$ FORMAT 'TEXT';
CREATE EXTERNAL WEB TABLE ext_do_create_seg_gpfdist ( result TEXT ) EXECUTE $$DISTPORT=$(($GP_SEGMENT_ID + 7001));cd $GP_SEG_DATADIR/TPCDS/;gpfdist -d $GP_SEG_DATADIR/TPCDS/ -p $DISTPORT -l /home/gpadmin/gpfdist$DISTPORT.log &$$ FORMAT 'TEXT';
