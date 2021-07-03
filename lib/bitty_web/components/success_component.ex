defmodule BittyWeb.SuccessComponent do
  @moduledoc false
  use BittyWeb, :live_component

  def render(assigns) do
    ~L"""
    <div class="relative">
      <div class="sm:text-center">
        <h2 class="text-3xl font-extrabold tracking-tight text-white sm:text-4xl">
          Short URLs. Big Results.
        </h2>
        <p class="max-w-2xl mx-auto mt-6 text-lg text-gray-200">
          Together we&apos;ve done it! The blocks have been chained. The URLs tinyfied.
        </p>
      </div>
      <div class="mt-12 sm:mx-auto sm:max-w-full sm:flex">
        <div class="flex justify-center flex-1 min-w-0">
          <div>
            <a href="<%= @short_url %>" class="text-xl font-bold text-right text-white"><%= @short_url %></a>
          </div>
          <div class="ml-6">
          </div>
        </div>
      </div>
    </div>
    """
  end
end
