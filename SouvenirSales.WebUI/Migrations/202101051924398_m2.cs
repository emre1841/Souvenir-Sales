namespace SouvenirSales.WebUI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class m2 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Categories", "ParentID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Categories", "ParentID", c => c.Int(nullable: false));
        }
    }
}
