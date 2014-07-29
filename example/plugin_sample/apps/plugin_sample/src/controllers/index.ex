defmodule Index do
  def get(_request) do
    :paris_response.render(:html, [template: :ok])
  end

  def post(_request) do
    :paris_response.render(:html, [template: :ok])
  end
  
  def put(_request) do
    :paris_response.render(:html, [template: :ok])
  end
  
  def head(_request) do
    :paris_response.render(:html, [template: :ok])
  end
  
  def delete(_request) do
    :paris_response.render(:html, [template: :ok])
  end
end
