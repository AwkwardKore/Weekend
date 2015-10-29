module PlacesHelper
  def mood_id_select
    names = Mood.all
      moods_all = []

      names.each do |t|
        moods_all << [t.name, t.id]

      end
      moods_all
  end

  def category_id_select
    names = Category.all
      categories_all = []

      names.each do |t|
        categories_all << [t.name, t.id]

      end
      categories_all
  end
end
