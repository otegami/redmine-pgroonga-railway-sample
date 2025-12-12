# Redmine with PGroonga on Railway

Redmine 6.1 with [full_text_search](https://github.com/clear-code/redmine_full_text_search) plugin, configured for Railway deployment with PGroonga.

## Deploy to Railway

### 1. Add PGroonga service

Add the [PGroonga template](https://railway.com/template/pgroonga) to your Railway project.

### 2. Add Redmine service

Add this repository as a new service in your Railway project.

### 3. Configure environment variables

Set the following variables for the Redmine service (reference PGroonga service variables):

| Variable | Value |
|----------|-------|
| `REDMINE_DB_POSTGRES` | `${{PGroonga.PGHOST}}` |
| `REDMINE_DB_PORT` | `${{PGroonga.PGPORT}}` |
| `REDMINE_DB_USERNAME` | `${{PGroonga.PGUSER}}` |
| `REDMINE_DB_PASSWORD` | `${{PGroonga.PGPASSWORD}}` |
| `REDMINE_DB_DATABASE` | `${{PGroonga.PGDATABASE}}` |
| `REDMINE_PLUGINS_MIGRATE` | `true` |
| `RAILS_ENV` | `production` |

### 4. Create full-text search indexes

After deployment, run the following command to create indexes for existing data:

```bash
railway run --service redmine bin/rails full_text_search:synchronize
```

## License

MIT License. See [LICENSE](LICENSE) for details.
