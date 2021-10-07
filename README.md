#### Clone this repo anywhere you want and move into the directory:

```sh
git clone https://github.com/Bukvar1337/rambler_api.git
cd rambler_api
```

#### Copy an example file because the real files are git ignored:

```sh
cp .env.example .env
```

#### Edit .env file with your db params
```sh
RAILS_MAX_THREADS=5
DB_HOST=localhost
DB_PORT=5432
DB_NAME=ramblerDB
DB_USER=postgres
DB_PASSWORD=MyPassword
```
#### Endpoints:

```sh
{
    "items": [
        {
            "name": "topics",
            "requests": [
                {
                    "method": "GET",
                    "description": "Get an array of topics",
                    "path": "/api/topics",
                    "query": [
                        {
                            "key": "sort_column",
                            "value": "<string>",
                            "description": "sort by field (id, created_at)"
                        },
                        {
                            "key": "sort_method",
                            "value": "<string>",
                            "description": "sort by method (ASC, DESC)"
                        },
                        {
                            "key": "id[]",
                            "value": "<integer>",
                            "description": "filter by id"
                        },
                        {
                            "key": "rubric_id",
                            "value": "<integer>",
                            "description": "filter by rubric"
                        },
                        {
                            "key": "tag_id",
                            "value": "<integer>",
                            "description": "filter by tag"
                        }
                    ]
                },
                {
                    "method": "GET",
                    "description": "Get a topic by urn field",
                    "path": "/api/topics/:urn"
                },
                {
                    "method": "POST",
                    "description": "Create a topic",
                    "path": "/api/topics",
                    "body": {
                        "heading": "<string>",
                        "announcement": "<text>",
                        "cover": "<text>",
                        "urn": "<text>",
                        "body": "<text>",
                        "rubric_id": "<integer>",
                        "tags_attributes": [ // Use to add tags
                            {
                                "tag_id": "<integer>" 
                            }
                        ],
                        "tag_topics_attributes":[ // Use to create tags
                            {
                                "title": "<string"
                            }
                        ]
                    }
                },
                {
                    "method": "PUT",
                    "description": "Update a topic by urn field",
                    "path": "/api/topics/:urn",
                    "body": "same as in POST method"
                },
                {
                    "method": "DELETE",
                    "description": "Delete a topic by urn field",
                    "path": "/api/topics/:urn"
                }                
            ]
        },
        {
            "name": "rubrics",
            "requests": [
                {
                    "method": "GET",
                    "description": "Get an array of rubrics",
                    "path": "/api/rubrics",
                    "query": [
                        {
                            "key": "search_string",
                            "value": "<string>",
                            "description": "search by title field"
                        }
                    ]
                },
                {
                    "method": "GET",
                    "description": "Get a rubric by id field",
                    "path": "/api/rubrics/:id"
                },
                {
                    "method": "POST",
                    "description": "Create a rubric",
                    "path": "/api/rubrics",
                    "body": {
                        "title": "<string>"
                    }
                },
                {
                    "method": "PUT",
                    "description": "Update a rubric by id field",
                    "path": "/api/rubrics/:id",
                    "body": "same as in POST method"
                },
                {
                    "method": "DELETE",
                    "description": "Delete a rubric by id field",
                    "path": "/api/rubrics/:id"
                }                
            ]
        },
         {
            "name": "tags",
            "requests": [
                {
                    "method": "GET",
                    "description": "Get an array of tags",
                    "path": "/api/tags",
                    "query": [
                        {
                            "key": "search_string",
                            "value": "<string>",
                            "description": "search by title field"
                        }
                    ]
                },
                {
                    "method": "GET",
                    "description": "Get a tags by id field",
                    "path": "/api/tags/:id"
                },
                {
                    "method": "POST",
                    "description": "Create a tag",
                    "path": "/api/tags",
                    "body": {
                        "title": "<string>"
                    }
                },
                {
                    "method": "PUT",
                    "description": "Update a tag by id field",
                    "path": "/api/tags/:id",
                    "body": "same as in POST method"
                },
                {
                    "method": "DELETE",
                    "description": "Delete a tag by id field",
                    "path": "/api/tags/:id"
                }                
            ]
        }
    ]
}
```

