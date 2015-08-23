#!/bin/bash
# Simple script to process all of the images inside the inputs/ folder
# We will be running this script inside the visionai/clouddream Docker image
# Copyright vision.ai, 2015

cd /opt/deepdream/inputs
find . -type f -not -path '*/\.*' -print0 | while read -d $'\0' f;
do
    cd /opt/deepdream
    if [ -e outputs/${f} ];
    then
	echo "File ${f} already processed"
    else
	echo "Deepdream" ${f}
	chmod gou+r inputs/${f}
	cp inputs/${f} input.jpg


tmpfile1="conv1_7x7_s2.jpg"
python deepdream.py conv1/7x7_s2 ${tmpfile1} &

tmpfile229985="pool1_3x3_s2.jpg"
python deepdream.py pool1/3x3_s2 ${tmpfile229985} &

tmpfile232133="pool1_norm1.jpg"
python deepdream.py pool1/norm1 ${tmpfile232133} &

tmpfile23052="conv2_3x3_reduce.jpg"
python deepdream.py conv2/3x3_reduce ${tmpfile23052} &

tmpfile225162="conv2_3x3.jpg"
python deepdream.py conv2/3x3 ${tmpfile225162} &

wait
echo "Stage 1 complete, cleaning files."
cp ${tmpfile1} outputs/${f}${tmpfile1}
rm ${tmpfile1}
cp ${tmpfile229985} outputs/${f}${tmpfile229985}
rm ${tmpfile229985}
cp ${tmpfile232133} outputs/${f}${tmpfile232133}
rm ${tmpfile232133}
cp ${tmpfile23052} outputs/${f}${tmpfile23052}
rm ${tmpfile23052}
cp ${tmpfile225162} outputs/${f}${tmpfile225162}
rm ${tmpfile225162}

tmpfile231006="conv2_norm2.jpg"
python deepdream.py conv2/norm2 ${tmpfile231006} &

tmpfile217413="pool2_3x3_s2.jpg"
python deepdream.py pool2/3x3_s2 ${tmpfile217413} &

tmpfile227272="inception_3a_1x1.jpg"
python deepdream.py inception_3a/1x1 ${tmpfile227272} &

tmpfile214950="inception_3a_3x3_reduce.jpg"
python deepdream.py inception_3a/3x3_reduce ${tmpfile214950} &

tmpfile29484="inception_3a_3x3.jpg"
python deepdream.py inception_3a/3x3 ${tmpfile29484} &

wait
echo "Stage 2 complete, cleaning files."
cp ${tmpfile231006} outputs/${f}${tmpfile231006}
rm ${tmpfile231006}
cp ${tmpfile217413} outputs/${f}${tmpfile217413}
rm ${tmpfile217413}
cp ${tmpfile227272} outputs/${f}${tmpfile227272}
rm ${tmpfile227272}
cp ${tmpfile214950} outputs/${f}${tmpfile214950}
rm ${tmpfile214950}
cp ${tmpfile29484} outputs/${f}${tmpfile29484}
rm ${tmpfile29484}

tmpfile29886="inception_3a_5x5_reduce.jpg"
python deepdream.py inception_3a/5x5_reduce ${tmpfile29886} &

tmpfile222480="inception_3a_5x5.jpg"
python deepdream.py inception_3a/5x5 ${tmpfile222480} &

tmpfile220791="inception_3a_pool.jpg"
python deepdream.py inception_3a/pool ${tmpfile220791} &

tmpfile223429="inception_3a_pool_proj.jpg"
python deepdream.py inception_3a/pool_proj ${tmpfile223429} &

tmpfile225183="inception_3a_output.jpg"
python deepdream.py inception_3a/output ${tmpfile225183} &

wait
echo "Stage 3 complete, cleaning files."
cp ${tmpfile29886} outputs/${f}${tmpfile29886}
rm ${tmpfile29886}
cp ${tmpfile222480} outputs/${f}${tmpfile222480}
rm ${tmpfile222480}
cp ${tmpfile220791} outputs/${f}${tmpfile220791}
rm ${tmpfile220791}
cp ${tmpfile223429} outputs/${f}${tmpfile223429}
rm ${tmpfile223429}
cp ${tmpfile225183} outputs/${f}${tmpfile225183}
rm ${tmpfile225183}

tmpfile217093="inception_3b_1x1.jpg"
python deepdream.py inception_3b/1x1 ${tmpfile217093} &

tmpfile220776="inception_3b_3x3_reduce.jpg"
python deepdream.py inception_3b/3x3_reduce ${tmpfile220776} &

tmpfile221020="inception_3b_3x3.jpg"
python deepdream.py inception_3b/3x3 ${tmpfile221020} &

tmpfile212269="inception_3b_5x5.jpg"
python deepdream.py inception_3b/5x5 ${tmpfile212269} &

tmpfile29284="inception_3b_pool.jpg"
python deepdream.py inception_3b/pool ${tmpfile29284} &

wait
echo "Stage 4 complete, cleaning files."
cp ${tmpfile217093} outputs/${f}${tmpfile217093}
rm ${tmpfile217093}
cp ${tmpfile220776} outputs/${f}${tmpfile220776}
rm ${tmpfile220776}
cp ${tmpfile221020} outputs/${f}${tmpfile221020}
rm ${tmpfile221020}
cp ${tmpfile212269} outputs/${f}${tmpfile212269}
rm ${tmpfile212269}
cp ${tmpfile29284} outputs/${f}${tmpfile29284}
rm ${tmpfile29284}

tmpfile219041="inception_3b_pool_proj.jpg"
python deepdream.py inception_3b/pool_proj ${tmpfile219041} &

tmpfile217592="inception_3b_output.jpg"
python deepdream.py inception_3b/output ${tmpfile217592} &

tmpfile226377="pool3_3x3_s2.jpg"
python deepdream.py pool3/3x3_s2 ${tmpfile226377} &

tmpfile210560="inception_4a_1x1.jpg"
python deepdream.py inception_4a/1x1 ${tmpfile210560} &

tmpfile24578="inception_4a_3x3_reduce.jpg"
python deepdream.py inception_4a/3x3_reduce ${tmpfile24578} &

wait
echo "Stage 5 complete, cleaning files."
cp ${tmpfile219041} outputs/${f}${tmpfile219041}
rm ${tmpfile219041}
cp ${tmpfile217592} outputs/${f}${tmpfile217592}
rm ${tmpfile217592}
cp ${tmpfile226377} outputs/${f}${tmpfile226377}
rm ${tmpfile226377}
cp ${tmpfile210560} outputs/${f}${tmpfile210560}
rm ${tmpfile210560}
cp ${tmpfile24578} outputs/${f}${tmpfile24578}
rm ${tmpfile24578}

tmpfile23051="inception_4a_3x3.jpg"
python deepdream.py inception_4a/3x3 ${tmpfile23051} &

tmpfile229078="inception_4a_5x5_reduce.jpg"
python deepdream.py inception_4a/5x5_reduce ${tmpfile229078} &

tmpfile211657="inception_4a_5x5.jpg"
python deepdream.py inception_4a/5x5 ${tmpfile211657} &

tmpfile23650="inception_4a_pool.jpg"
python deepdream.py inception_4a/pool ${tmpfile23650} &

tmpfile29797="inception_4a_pool_proj.jpg"
python deepdream.py inception_4a/pool_proj ${tmpfile29797} &

wait
echo "Stage 6 complete, cleaning files."
cp ${tmpfile23051} outputs/${f}${tmpfile23051}
rm ${tmpfile23051}
cp ${tmpfile229078} outputs/${f}${tmpfile229078}
rm ${tmpfile229078}
cp ${tmpfile211657} outputs/${f}${tmpfile211657}
rm ${tmpfile211657}
cp ${tmpfile23650} outputs/${f}${tmpfile23650}
rm ${tmpfile23650}
cp ${tmpfile29797} outputs/${f}${tmpfile29797}
rm ${tmpfile29797}

tmpfile211438="inception_4a_output.jpg"
python deepdream.py inception_4a/output ${tmpfile211438} &

tmpfile220610="inception_4b_1x1.jpg"
python deepdream.py inception_4b/1x1 ${tmpfile220610} &

tmpfile28095="inception_4b_3x3_reduce.jpg"
python deepdream.py inception_4b/3x3_reduce ${tmpfile28095} &

tmpfile210287="inception_4b_3x3.jpg"
python deepdream.py inception_4b/3x3 ${tmpfile210287} &

tmpfile27008="inception_4b_5x5_reduce.jpg"
python deepdream.py inception_4b/5x5_reduce ${tmpfile27008} &

wait
echo "Stage 7 complete, cleaning files."
cp ${tmpfile211438} outputs/${f}${tmpfile211438}
rm ${tmpfile211438}
cp ${tmpfile220610} outputs/${f}${tmpfile220610}
rm ${tmpfile220610}
cp ${tmpfile28095} outputs/${f}${tmpfile28095}
rm ${tmpfile28095}
cp ${tmpfile210287} outputs/${f}${tmpfile210287}
rm ${tmpfile210287}
cp ${tmpfile27008} outputs/${f}${tmpfile27008}
rm ${tmpfile27008}

tmpfile230124="inception_4b_5x5.jpg"
python deepdream.py inception_4b/5x5 ${tmpfile230124} &

tmpfile229034="inception_4b_pool.jpg"
python deepdream.py inception_4b/pool ${tmpfile229034} &

tmpfile25039="inception_4b_pool_proj.jpg"
python deepdream.py inception_4b/pool_proj ${tmpfile25039} &

tmpfile21139="inception_4b_output.jpg"
python deepdream.py inception_4b/output ${tmpfile21139} &

tmpfile210415="inception_4c_1x1.jpg"
python deepdream.py inception_4c/1x1 ${tmpfile210415} &

wait
echo "Stage 8 complete, cleaning files."
cp ${tmpfile230124} outputs/${f}${tmpfile230124}
rm ${tmpfile230124}
cp ${tmpfile229034} outputs/${f}${tmpfile229034}
rm ${tmpfile229034}
cp ${tmpfile25039} outputs/${f}${tmpfile25039}
rm ${tmpfile25039}
cp ${tmpfile21139} outputs/${f}${tmpfile21139}
rm ${tmpfile21139}
cp ${tmpfile210415} outputs/${f}${tmpfile210415}
rm ${tmpfile210415}

tmpfile210479="inception_4c_3x3_reduce.jpg"
python deepdream.py inception_4c/3x3_reduce ${tmpfile210479} &

tmpfile215725="inception_4c_3x3.jpg"
python deepdream.py inception_4c/3x3 ${tmpfile215725} &

tmpfile21592="inception_4c_5x5_reduce.jpg"
python deepdream.py inception_4c/5x5_reduce ${tmpfile21592} &

tmpfile22038="inception_4c_5x5.jpg"
python deepdream.py inception_4c/5x5 ${tmpfile22038} &

tmpfile24479="inception_4c_pool.jpg"
python deepdream.py inception_4c/pool ${tmpfile24479} &

wait
echo "Stage 9 complete, cleaning files."
cp ${tmpfile210479} outputs/${f}${tmpfile210479}
rm ${tmpfile210479}
cp ${tmpfile215725} outputs/${f}${tmpfile215725}
rm ${tmpfile215725}
cp ${tmpfile21592} outputs/${f}${tmpfile21592}
rm ${tmpfile21592}
cp ${tmpfile22038} outputs/${f}${tmpfile22038}
rm ${tmpfile22038}
cp ${tmpfile24479} outputs/${f}${tmpfile24479}
rm ${tmpfile24479}

tmpfile222524="inception_4c_pool_proj.jpg"
python deepdream.py inception_4c/pool_proj ${tmpfile222524} &

tmpfile225690="inception_4c_output.jpg"
python deepdream.py inception_4c/output ${tmpfile225690} &

tmpfile220653="inception_4d_1x1.jpg"
python deepdream.py inception_4d/1x1 ${tmpfile220653} &

tmpfile219224="inception_4d_3x3_reduce.jpg"
python deepdream.py inception_4d/3x3_reduce ${tmpfile219224} &

tmpfile230510="inception_4d_3x3.jpg"
python deepdream.py inception_4d/3x3 ${tmpfile230510} &

wait
echo "Stage 10 complete, cleaning files."
cp ${tmpfile222524} outputs/${f}${tmpfile222524}
rm ${tmpfile222524}
cp ${tmpfile225690} outputs/${f}${tmpfile225690}
rm ${tmpfile225690}
cp ${tmpfile220653} outputs/${f}${tmpfile220653}
rm ${tmpfile220653}
cp ${tmpfile219224} outputs/${f}${tmpfile219224}
rm ${tmpfile219224}
cp ${tmpfile230510} outputs/${f}${tmpfile230510}
rm ${tmpfile230510}

tmpfile216505="inception_4d_5x5_reduce.jpg"
python deepdream.py inception_4d/5x5_reduce ${tmpfile216505} &

tmpfile219551="inception_4d_5x5.jpg"
python deepdream.py inception_4d/5x5 ${tmpfile219551} &

tmpfile23100="inception_4d_pool.jpg"
python deepdream.py inception_4d/pool ${tmpfile23100} &

tmpfile229706="inception_4d_pool_proj.jpg"
python deepdream.py inception_4d/pool_proj ${tmpfile229706} &

tmpfile219001="inception_4d_output.jpg"
python deepdream.py inception_4d/output ${tmpfile219001} &

wait
echo "Stage 11 complete, cleaning files."
cp ${tmpfile216505} outputs/${f}${tmpfile216505}
rm ${tmpfile216505}
cp ${tmpfile219551} outputs/${f}${tmpfile219551}
rm ${tmpfile219551}
cp ${tmpfile23100} outputs/${f}${tmpfile23100}
rm ${tmpfile23100}
cp ${tmpfile229706} outputs/${f}${tmpfile229706}
rm ${tmpfile229706}
cp ${tmpfile219001} outputs/${f}${tmpfile219001}
rm ${tmpfile219001}

tmpfile29831="inception_4e_1x1.jpg"
python deepdream.py inception_4e/1x1 ${tmpfile29831} &

tmpfile229510="inception_4e_3x3_reduce.jpg"
python deepdream.py inception_4e/3x3_reduce ${tmpfile229510} &

tmpfile215753="inception_4e_3x3.jpg"
python deepdream.py inception_4e/3x3 ${tmpfile215753} &

tmpfile221030="inception_4e_5x5_reduce.jpg"
python deepdream.py inception_4e/5x5_reduce ${tmpfile221030} &

tmpfile214013="inception_4e_5x5.jpg"
python deepdream.py inception_4e/5x5 ${tmpfile214013} &

wait
echo "Stage 12 complete, cleaning files."
cp ${tmpfile29831} outputs/${f}${tmpfile29831}
rm ${tmpfile29831}
cp ${tmpfile229510} outputs/${f}${tmpfile229510}
rm ${tmpfile229510}
cp ${tmpfile215753} outputs/${f}${tmpfile215753}
rm ${tmpfile215753}
cp ${tmpfile221030} outputs/${f}${tmpfile221030}
rm ${tmpfile221030}
cp ${tmpfile214013} outputs/${f}${tmpfile214013}
rm ${tmpfile214013}

tmpfile212200="inception_4e_pool.jpg"
python deepdream.py inception_4e/pool ${tmpfile212200} &

tmpfile227372="inception_4e_pool_proj.jpg"
python deepdream.py inception_4e/pool_proj ${tmpfile227372} &

tmpfile231464="inception_4e_output.jpg"
python deepdream.py inception_4e/output ${tmpfile231464} &

tmpfile23381="pool4_3x3_s2.jpg"
python deepdream.py pool4/3x3_s2 ${tmpfile23381} &

tmpfile217280="inception_5a_1x1.jpg"
python deepdream.py inception_5a/1x1 ${tmpfile217280} &

wait
echo "Stage 13 complete, cleaning files."
cp ${tmpfile212200} outputs/${f}${tmpfile212200}
rm ${tmpfile212200}
cp ${tmpfile227372} outputs/${f}${tmpfile227372}
rm ${tmpfile227372}
cp ${tmpfile231464} outputs/${f}${tmpfile231464}
rm ${tmpfile231464}
cp ${tmpfile23381} outputs/${f}${tmpfile23381}
rm ${tmpfile23381}
cp ${tmpfile217280} outputs/${f}${tmpfile217280}
rm ${tmpfile217280}

tmpfile26519="inception_5a_3x3_reduce.jpg"
python deepdream.py inception_5a/3x3_reduce ${tmpfile26519} &

tmpfile23651="inception_5a_3x3.jpg"
python deepdream.py inception_5a/3x3 ${tmpfile23651} &

tmpfile23931="inception_5a_5x5_reduce.jpg"
python deepdream.py inception_5a/5x5_reduce ${tmpfile23931} &

tmpfile27247="inception_5a_5x5.jpg"
python deepdream.py inception_5a/5x5 ${tmpfile27247} &

tmpfile218304="inception_5a_pool.jpg"
python deepdream.py inception_5a/pool ${tmpfile218304} &

wait
echo "Stage 14 complete, cleaning files."
cp ${tmpfile26519} outputs/${f}${tmpfile26519}
rm ${tmpfile26519}
cp ${tmpfile23651} outputs/${f}${tmpfile23651}
rm ${tmpfile23651}
cp ${tmpfile23931} outputs/${f}${tmpfile23931}
rm ${tmpfile23931}
cp ${tmpfile27247} outputs/${f}${tmpfile27247}
rm ${tmpfile27247}
cp ${tmpfile218304} outputs/${f}${tmpfile218304}
rm ${tmpfile218304}

tmpfile218869="inception_5a_pool_proj.jpg"
python deepdream.py inception_5a/pool_proj ${tmpfile218869} &

tmpfile232019="inception_5a_output.jpg"
python deepdream.py inception_5a/output ${tmpfile232019} &

tmpfile216211="inception_5b_1x1.jpg"
python deepdream.py inception_5b/1x1 ${tmpfile216211} &

tmpfile211701="inception_5b_3x3_reduce.jpg"
python deepdream.py inception_5b/3x3_reduce ${tmpfile211701} &

tmpfile216226="inception_5b_3x3.jpg"
python deepdream.py inception_5b/3x3 ${tmpfile216226} &

wait
echo "Stage 15 complete, cleaning files."
cp ${tmpfile218869} outputs/${f}${tmpfile218869}
rm ${tmpfile218869}
cp ${tmpfile232019} outputs/${f}${tmpfile232019}
rm ${tmpfile232019}
cp ${tmpfile216211} outputs/${f}${tmpfile216211}
rm ${tmpfile216211}
cp ${tmpfile211701} outputs/${f}${tmpfile211701}
rm ${tmpfile211701}
cp ${tmpfile216226} outputs/${f}${tmpfile216226}
rm ${tmpfile216226}

tmpfile226769="inception_5b_5x5_reduce.jpg"
python deepdream.py inception_5b/5x5_reduce ${tmpfile226769} &

tmpfile226208="inception_5b_5x5.jpg"
python deepdream.py inception_5b/5x5 ${tmpfile226208} &

tmpfile21358="inception_5b_pool.jpg"
python deepdream.py inception_5b/pool ${tmpfile21358} &

tmpfile211745="inception_5b_pool_proj.jpg"
python deepdream.py inception_5b/pool_proj ${tmpfile211745} &

tmpfile23128="inception_5b_output.jpg"
python deepdream.py inception_5b/output ${tmpfile23128} &

wait
echo "Stage 16 complete, cleaning files."
cp ${tmpfile226769} outputs/${f}${tmpfile226769}
rm ${tmpfile226769}
cp ${tmpfile226208} outputs/${f}${tmpfile226208}
rm ${tmpfile226208}
cp ${tmpfile21358} outputs/${f}${tmpfile21358}
rm ${tmpfile21358}
cp ${tmpfile211745} outputs/${f}${tmpfile211745}
rm ${tmpfile211745}
cp ${tmpfile23128} outputs/${f}${tmpfile23128}
rm ${tmpfile23128}


tmpfile="inception_3b_5x5_reduce.jpg"
python deepdream.py inception_3b/5x5_reduce ${tmpfile} &

wait

cp ${tmpfile} outputs/${f}
rm ${tmpfile}
echo "IMAGE COMPLETE. Just created" outputs/${f}

    fi
done


