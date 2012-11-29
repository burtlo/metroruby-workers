class AssetPaths
  def initialize(options)
    @user_name = options[:user_name].underscore.gsub(/\s/,'_')
    @game_name = options[:game_name].underscore.gsub(/\s/,'_')
  end

  attr_reader :user_name, :game_name

  def base_path
    File.join File.dirname(__FILE__), ".."
  end

  def relative_user_path
    File.join @user_name
  end

  def relative_user_game_path
    File.join relative_user_path, @game_name
  end

  def user_path
    File.absolute_path File.join(base_path,relative_user_path)
  end

  def user_game_path
    File.absolute_path File.join(base_path,relative_user_game_path)
  end

  def resource(resource_path)
    File.join user_game_path, resource_path
  end

end
