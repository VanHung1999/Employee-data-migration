def cut_string(a):
    b = ""
    d = ""
    e = ""
    f = ""
    h = ""
    for i in range(2,len(a)-1):
        b += a[i]
    b = b.replace('"','')
    b = b.replace(':',' ')
    b = b.replace(',',' ')
    c = b.split(" ")
    for i in range(0,9):
        if c[i] == 'startDate':
            d = c[i+1]
            e = c[i+2]
            f = c[i+4]
            g = d + " " + e + "," + " " + f
        if c[i] == 'phoneNumber':
            h = c[i+1]
    return g , h




    
