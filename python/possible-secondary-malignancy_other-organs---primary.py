# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"104699.0","system":"med"},{"code":"16500.0","system":"med"},{"code":"18616.0","system":"med"},{"code":"22524.0","system":"med"},{"code":"24293.0","system":"med"},{"code":"24301.0","system":"med"},{"code":"27651.0","system":"med"},{"code":"3152.0","system":"med"},{"code":"3197.0","system":"med"},{"code":"35053.0","system":"med"},{"code":"48991.0","system":"med"},{"code":"54120.0","system":"med"},{"code":"54253.0","system":"med"},{"code":"5455.0","system":"med"},{"code":"54679.0","system":"med"},{"code":"54874.0","system":"med"},{"code":"56345.0","system":"med"},{"code":"57481.0","system":"med"},{"code":"5842.0","system":"med"},{"code":"62584.0","system":"med"},{"code":"6471.0","system":"med"},{"code":"66083.0","system":"med"},{"code":"68332.0","system":"med"},{"code":"6985.0","system":"med"},{"code":"8600.0","system":"med"},{"code":"88022.0","system":"med"},{"code":"9366.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('secondary-malignancy_other-organs-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["possible-secondary-malignancy_other-organs---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["possible-secondary-malignancy_other-organs---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["possible-secondary-malignancy_other-organs---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
