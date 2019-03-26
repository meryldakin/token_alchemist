defmodule TokenAlchemist do
  @oauth_key "1234"
  @oauth_secret "5678"

  def transmute do
    signature = get_json()
    |> generate_oauth_signature()
    IO.puts message() <> signature
  end

  defp oauth_clients do
    %{"#{@oauth_key}" => @oauth_secret}
  end

  defp message do
    "\n*****************\n👩‍🔬 TOKEN MINTED\n>>> 🔑 Authorization\n>>> 🚪 Bearer "
  end

  defp generate_oauth_signature(params) do
    :crypto.hmac(:sha256, oauth_secret_for_key(params) <> "&", params_string(params))
    |> :base64.encode()
  end

  defp oauth_secret_for_key(%{"consumer_key" => consumer_key}) do
    oauth_clients()[consumer_key]
  end

  defp params_string(params) do
    Enum.map(params, fn {k, v} -> "#{k}=#{v}" end)
    |> Enum.join("&")
  end

  defp get_json do
    with {:ok, body} <- File.read("lib/ingredients.json"),
         {:ok, json} <- Jason.decode!(body), do: {:ok, json}
  end
end
