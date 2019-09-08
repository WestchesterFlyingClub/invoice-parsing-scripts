BEGIN { OFS="," }

/Invoice/ {
    invoice=$2
    date=$3
    getline;
    gsub(/\./,":",$1)
    time=$1
}


/1.*Fuel.*100LL/ {
    nnumber=$4
    gallons=$5
    rate=$7
    total=$8
    actualrate=total/gallons
    print date,time,invoice,"KPOU","FlightLevel",nnumber,gallons,rate,actualrate,total
}
