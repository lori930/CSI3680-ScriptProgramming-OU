function showunit(kb) { 
    mb = kb / 1024
    gb = mb / 1024
    return ( gb >= 1 ? gb "G" : mb >= 1 ? mb "M" : kb "K" ) 
}
