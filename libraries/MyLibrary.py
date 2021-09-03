def cut_string1(a):
    b=""
    for i in range(16,28):
        b+=a[i]
    return b

def cut_string2(a):
    b=""
    c=""
    for i in range(43,46):
        b+=a[i]
    if b == "May":
        for i in range(43,55):
            c+=a[i]
    elif b == "Jun" or b == "Jul":
        for i in range(43,56):
            c+=a[i]
    elif b == "Mar" or b == "Apr":
        for i in range(43,57):
            c+=a[i]
    elif b == "Aug":
        for i in range(43,58):
            c+=a[i]
    elif b == "Jan" or b == "Oct":
        for i in range(43,59):
            c+=a[i]
    elif b == "Nov" or b == "Dec":
        for i in range(43,60):
            c+=a[i]
    else:
        for i in range(43,61):
            c+=a[i]
    return c

    
