#!/bin/bash

NzList=(30 30 30 30 60 60 60 60 120 120 120 120)
NxList=(100 100 100 100 200 200 200 200 400 400 400 400)
dtList=(0.005 0.01 0.02 0.04 0.0025 0.005 0.01 0.02 0.00125 0.0025 0.005 0.01)
CoList=(01 02 04 08 01 02 04 08 01 02 04 08)

export L=5
export H=1.5
export T=4
export ny=1
export y1=-.5
export y2=.5
export Ux=1
export Uy=0
export Uz=0.125
export solver=isoAdvect

for n in ${!NzList[*]} 
do
    export nx=${NxList[$n]}
    export nz=${NzList[$n]}
    export dt=${dtList[$n]}
    caseName=N${NzList[$n]}Co${CoList[$n]}
    echo $caseName
    cp -r baseCase $caseName
    envsubst < baseCase/constant/polyMesh/blockMeshDict > ${caseName}/constant/polyMesh/blockMeshDict
    envsubst < baseCase/system/controlDict > ${caseName}/system/controlDict
    envsubst < baseCase/0.org/U > ${caseName}/0.org/U
    touch ${caseName}/${caseName}.foam
done