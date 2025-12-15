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
| `REDMINE_DB_POSTGRES` | `${{PGroonga.PGHOST_PRIVATE}}` |
| `REDMINE_DB_PORT` | `${{PGroonga.PGPORT_PRIVATE}}` |
| `REDMINE_DB_USERNAME` | `${{PGroonga.PGUSER}}` |
| `REDMINE_DB_PASSWORD` | `${{PGroonga.PGPASSWORD}}` |
| `REDMINE_DB_DATABASE` | `${{PGroonga.PGDATABASE}}` |
| `REDMINE_PLUGINS_MIGRATE` | `true` |
| `RAILS_ENV` | `production` |

```json
{
  "RAILS_ENV": "production",
  "REDMINE_DB_DATABASE": "${{PGroonga.PGDATABASE}}",
  "REDMINE_DB_PASSWORD": "${{PGroonga.PGPASSWORD}}",
  "REDMINE_DB_PORT": "${{PGroonga.PGPORT_PRIVATE}}",
  "REDMINE_DB_POSTGRES": "${{PGroonga.PGHOST_PRIVATE}}",
  "REDMINE_DB_USERNAME": "${{PGroonga.PGUSER}}",
  "REDMINE_PLUGINS_MIGRATE": "true"
}
```

> **Tip:** Want to try full-text search quickly? You can load test data after deployment. See steps 4-7 for details.

### 4. Install Railway CLI

Install Railway CLI.
- https://docs.railway.com/guides/cli#installing-the-cli

```bash
railway --version
railway x.xx.xx
```

### 5. Link to the target Railway project

Please link to your target project and service.
After using the following command, you can choose the project and service using shell.

```bash
railway link
```

### 6. Load test data (optional)

To try out full-text search immediately, load sample data:

```bash
railway ssh --session
bin/rails db:fixtures:load
```

### 7. Create full-text search indexes (optional)

After deployment, run the following command to create indexes for existing data:

```bash
railway ssh --session
bin/rails full_text_search:synchronize
```

## License

MIT License. See [LICENSE](LICENSE) for details.
