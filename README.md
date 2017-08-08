# JobJawn

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Initial mix tasks that created this project
mix credo gen.config
mix phx.gen.schema Listing.Industry industries name:string slug:string
mix phx.gen.schema Listing.Company companies name:string slug:string homepage:text jobs_page:text industry_id:references:industries
mix phx.gen.schema Listing.Address addresses line_1:string line_2:string city:string state:string zip:string phone:string lat:float long:float company_id:references:companies
mix phx.gen.schema Listing.Discipline disciplines name:string slug:string
mix phx.gen.schema Listing.EmploymentType employment_types name:string slug:string
mix phx.gen.schema Listing.Title titles name:string slug:string discipline_id:references:disciplines
mix phx.gen.schema Listing.Skill skills name:string slug:string
mix phx.gen.schema Listing.Job jobs name:string url:text company_id:references:companies employment_type_id:references:employment_types title_id:references:titles address_id:references:addresses
