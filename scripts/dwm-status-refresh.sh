print_hello()
{
    echo "Have A Good Time,$USER! "
}
print_date(){
    date '+%Y-%m-%d %H:%M:%S'
}
print_mem()
{
    free -h | awk '/Mem:/ {printf("%s/%s\n",$3,$2)}'
}
xsetroot -name "|M:$(print_mem)|T:$(print_date)|"
exit 0
