using FluentValidation;
using FluentValidation.Results;
using System.Reflection;

namespace AwesomePlaces.Api.Helpers;

[Obsolete(message: "Obsolete because its failed implemented? I found better approach for my purpose by validation filter.")]
public class Validated<T>
{
	private ValidationResult ValidationResult { get; }

	private Validated(T value, ValidationResult validationResult)
	{
		Value = value;
		ValidationResult = validationResult;
	}

	public T Value { get; }

	public bool IsValid => ValidationResult.IsValid;

	public IDictionary<string, string[]> Errors => ValidationResult.Errors
		.GroupBy(validation => validation.PropertyName)
		.ToDictionary(error => error.Key, error => error.Select(message => message.ErrorMessage).ToArray());

	public void Deconstruct(out bool isValid, out T value)
	{
		isValid = IsValid;
		value = Value;
	}

	public static async ValueTask<Validated<T>> BindAsync(HttpContext httpContext, ParameterInfo parameterInfo)
	{
		var value = await httpContext.Request.ReadFromJsonAsync<T>() ?? throw new ArgumentException(nameof(parameterInfo.Name));
		var context = new ValidationContext<T>(value);

		IValidator validator = httpContext.RequestServices.GetRequiredService<IValidator<T>>();

		var results = await validator.ValidateAsync(context);
		return new Validated<T>(value, results);
	}
}
