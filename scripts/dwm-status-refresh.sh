print_hello()
{
    echo "Have A Good Time,$USER! "
}
print_date(){
    date '+%Y-%m-%d %H:%M:%S'
}
print_mem()
{
    free -h | awk '/Mem:/ { printf("%s/%s\n",$3,$2)}'
}
print_disk()
{
    df -h / | awk '/\//{ printf("%4s/%s\n",$4,$2)}'
}
xsetroot -name "$(print_mem) $(print_disk) $(print_date)"
exit 0
