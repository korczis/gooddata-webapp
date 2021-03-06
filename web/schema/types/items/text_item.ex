defmodule Webapp.Schema.Types.Item.TextItem do
  use Absinthe.Schema.Notation

  @desc "Text Item"
  object :text_item do
    field :position_x, :integer
    field :position_y, :integer
    field :size_x, :integer
    field :size_y, :integer
    field :category, :string
    field :text_size, :string
    field :text, :string

    interface :item
  end
end
