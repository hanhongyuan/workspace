(curl "https://www.ctfmall.com/c/gold/all/?top=20&keywords=%E9%BB%84%E9%87%91#" | Select -
ExpandProperty Content |findstr "%E9%BB%84%E9%87%91"|findstr "all").Split("<>")[8]