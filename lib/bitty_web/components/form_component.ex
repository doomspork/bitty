defmodule BittyWeb.FormComponent do
  use BittyWeb, :live_component

  def render(assigns) do
    ~L"""
     <div class="relative">
       <div class="sm:text-center">
         <h2 class="text-3xl font-extrabold tracking-tight text-white sm:text-4xl">
           Short URLs. Big Results.
         </h2>
         <p class="max-w-2xl mx-auto mt-6 text-lg text-gray-200">
         Never before has it been so easy to create short urls.
         By combining newly declassified military technology with the latest
         developments in blockchain technology we&apos;re able to deliver
         revolutionary URL shortening capables never previously imagined.
         </p>
       </div>
       <%= f = form_for @changeset, "#", [phx_submit: :save, class: "mt-12 sm:mx-auto sm:max-w-full sm:flex"] %>
       <div class="flex-1 min-w-0">
         <%= text_input f, :url, class: "block w-full px-5 py-3 text-base text-gray-900 placeholder-gray-500 border border-transparent rounded-md shadow-sm focus:outline-none focus:border-transparent focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-blue-400",
    placeholder: "https://example.com/averylongurlthatgoesnowherespecialbutisavalidurl" %>
          <%= error_tag f, :url %>
       </div>
       <div class="mt-4 sm:mt-0 sm:ml-3">
        <%= submit "Shorten!",
             class: "block w-full px-5 py-3 font-bold text-black bg-white border border-transparent shadow text-large rounded-md hover:bg-black hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-blue-400 sm:px-10"
        %>
       </div>
       </form>
     </div>
    """
  end
end
