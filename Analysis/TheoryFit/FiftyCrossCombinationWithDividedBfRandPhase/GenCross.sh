#!/bin/sh

# A function to generate random number
function rand(){    
    min=$1    
    max=$(($2-$min+1))    
    num=$(date +%s%N)    
    echo $(($num%$max+$min))    
}    


# Generate cross sections with different relative phases
mkdir EachPhase
cd EachPhase
for (( i =0; i<91; i= i+1))  
do
    mkdir $i
    cd $i
    cp ../../seed_gencross/* . -rf
    sed -i s/'seed_phase/'$i''/g fit_ks_phase.C
    touch job
    echo "#!/bin/bash" > job
    echo "./ROOTCompile fit_ks_phase" >> job
    echo "./fit_ks_phase" >> job
    touch sub
    echo "hep_sub -g physics job" > sub
    chmod 700 job
    echo "Model of phase:$i has been created.."
    cd ../
done
cd ../


# Combinate generated cross section with different branch fractions
mkdir Combination
cd Combination 
for (( i =1; i<101; i= i+1))
do
    dominantrnd=$(rand 0 90)
    echo $dominantrnd   
    mkdir Combination$i
    cd Combination$i
    j=0
    cp ../../EachPhase/$dominantrnd . -rf
    cd $dominantrnd
    sed -i s/'seed_Bf/.15'/g fit_ks_phase.C
    echo "$j ^th cross section is generating..."
    ./job
    let "j = $j + 1"
    cd ../
    BfFile="Bf_combination.txt"
    PhaseFile="Phase_combination.txt"
    touch $BfFile
    touch $PhaseFile
    echo ".15" > $BfFile
    echo "$dominantrnd" > $PhaseFile

    sum=0
    for (( k =0; k<49; k= k+1))
    do
        IntRnd[$k]=$(rand 1 100)
        let "sum = ${IntRnd[$k]} + $sum"
    done

    rnd_back=$dominantrnd
    while [ $j -le 49 ]; 
    do
        rnd=$(rand 0 90)
        if [ $rnd != $dominantrnd ]; then
            if [ $rnd != $rnd_back ]; then
                # Must note: NormRnd= `echo "scale=8; ${IntRnd[$i]} / $sum " | bc -l` is wrong, "NormRnd=" can't be followed by blankspace
                let "num = $j - 1"
                NormRnd=`echo "scale=8; 0.35 * ${IntRnd[$num]} / $sum " | bc -l`
                cp ../../EachPhase/$rnd . -rf
                cd $rnd
                sed -i s/'seed_Bf/'$NormRnd''/g fit_ks_phase.C
                echo "$j ^th cross section is generating..."
                ./job
                let "j = $j + 1"
                cd ../
                echo "$NormRnd" >> $BfFile
                echo "$rnd" >> $PhaseFile
                rnd_back=$rnd
            fi
        fi
    done
    cd ../
done
cd ../
exit 0  
