# This code is to be run on AWS.  
# Get stats for all tickets with destination MAD from coupons150720.csv. 
# You will need to extract ticket amounts with destination MAD, and then calculate:
# Total ticket amounts per origin

from __future__ import print_function
from pyspark.sql import SparkSession
from pyspark.sql import types # we have to create the sc variable 
import sys

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: mysparkjob arg1 arg2 ", file=sys.stderr)
        exit(-1)
    session = SparkSession.builder.getOrCreate()
    coupons_raw = session.read.csv(sys.argv[1])
    coupons = coupons_raw.select(coupons_raw[2].alias('origin'),
                       coupons_raw[3].alias('dest'),
                       coupons_raw[6].alias('amount').cast(types.FloatType())
                      )

    coupons_mad = coupons[coupons['dest'] == 'MAD']
    coupons_filtered = coupons_mad.groupBy('origin').sum('amount').sort('sum(amount)', ascending=False).limit(10)

    couponsRDD = coupons_filtered.rdd.map(list)
    couponsRDD.saveAsTextFile(sys.argv[2])
    sc.stop()
