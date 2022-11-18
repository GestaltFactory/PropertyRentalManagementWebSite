using CloudinaryDotNet.Actions;

namespace PropertyRentalManagementWebSite.Interfaces
{
    public interface ICloudPhotoService
    {
        Task<ImageUploadResult> AddPhotoAsync(IFormFile file);
        Task<DeletionResult> DeletePhotoAsync(string id);
    }
}
