
1. 获取所有项目地址：

```sql
SELECT 'sh /opt/backupcode.sh ssh://git@bit.sjfx.com.cn:7999/'  || p.project_key  ||  '/' || r.name || '.git '|| p.name || '-' || r.name
  FROM repository r INNER JOIN project p ON r.project_id = p.id
  WHERE p.project_type =0
  ORDER BY p.id,r.id
```
2. 备份

