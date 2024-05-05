namespace DiscDog.ApiService;

public class Team
{
    public Guid Id { get; set; }
    public string Person { get; set; }
    public string Dog { get; set; }
    public Guid ClubId { get; set; }
    public Club Club { get; set; }
}