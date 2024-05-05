namespace DiscDog.ApiService;

public class Club
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public ICollection<Team> Teams { get; set; } = new List<Team>();
}