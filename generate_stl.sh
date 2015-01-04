#!/bin/sh

OUTPUT_DIR=output

PARTS=
PARTS_WITH_MIRROR=

#foot
PARTS_WITH_MIRROR+=" ankle big_toe little_toe heel"

#leg
PARTS+=" knee_part1 knee_part2 thigh_mid_internal_p1 thigh_mid_internal_p2 thigh_potentiometer"
PARTS_WITH_MIRROR+=" calf_high calf_mid calf_low thigh_low thigh_mid_low_p1 thigh_mid_low_p2 thigh_mid_high"

if [ "$#" -ne 0 ]
then
  PARTS=$1
  PARTS_WITH_MIRROR=
fi

generate_stl() {
  NAME=$1
  MIRRORED=$2
  EXTRA=""

  if [ $MIRRORED == true ]
  then
    EXTRA+="_mirrored"
  fi

  OUTPUT_FILE="$OUTPUT_DIR/$NAME$EXTRA.stl"
  TMP_FILE="$OUTPUT_DIR/tmp_$NAME$EXTRA.scad"
  LOG_FILE="$OUTPUT_DIR/$NAME$EXTRA.log"

  echo "Generate file: $OUTPUT_FILE"

  #generate temporary scad file
  echo "include <../base_inc.scad>" > $TMP_FILE
  echo "\$fn = 100;" >> $TMP_FILE 
  echo "stl_dir_prefix = \"../\";" >> $TMP_FILE 
  if [ $MIRRORED == true ]
  then
    echo "mirror()" >> $TMP_FILE
  fi
  echo "$NAME();" >> $TMP_FILE

  #generate stl
  openscad -o $OUTPUT_FILE $TMP_FILE 2> $LOG_FILE

  #remove temporary files
  rm $TMP_FILE
}

#create output directory if not exist
mkdir -p $OUTPUT_DIR

#generate all parts
for p in $PARTS
do
  generate_stl $p false
done

#generate parts with their mirror (left)
for p in $PARTS_WITH_MIRROR
do
  generate_stl $p false
  generate_stl $p true
done
