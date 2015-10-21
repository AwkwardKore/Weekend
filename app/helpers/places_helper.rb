module PlacesHelper
  def mood_id_select
    names = Mood.all
      moods_all = []

      names.each do |t|
        moods_all << [t.name, t.id]

      end
      moods_all
  end
end
